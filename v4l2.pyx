import cython

from posix cimport fcntl,unistd, stat, time
from posix.ioctl cimport ioctl
from libc.errno cimport errno,EINTR,EINVAL
from libc.string cimport strerror
cimport cmman as mman
cimport cv4l2 as v4l2
cimport cv4lconvert as v4lconvert
cimport numpy as np
import numpy as np


#logging
import logging
logger = logging.getLogger(__name__)

def fourcc_string(i):
    s = chr(i & 255)
    for shift in (8,16,24):
        s += chr(i>>shift & 255)
    return s

def fourcc_u32(char * fourcc):
    return v4l2.v4l2_fourcc(fourcc[0],fourcc[1],fourcc[2],fourcc[3])


cdef class buffer_handle:
    cdef void *start
    cdef size_t length
                


cdef class Capture:
    cdef int dev_handle 
    cdef char *dev_name
    cdef bint _camera_streaming, _buffers_initialized
    cdef object _transport_formats, _frame_rates,_frame_sizes
    cdef object _transport_format, _frame_rate, _frame_size


    cdef list buffers
    def __cinit__(self,char *dev_name):
        pass

    def __init__(self,char *dev_name):
        self.dev_name = dev_name
        self.dev_handle = self.open_device()
        self.verify_device()

        self.get_format()

        self._transport_formats = None
        self._frame_rates = None
        self._frame_sizes = None

        self._buffers_initialized = False
        self._camera_streaming = False

        # if timebase == None:
        #     logger.debug("Capture will run with default system timebase")
        #     self.timebase = c_double(0)
        # elif isinstance(timebase,c_double):
        #     logger.debug("Capture will run with app wide adjustable timebase")
        #     self.timebase = timebase
        # else:
        #     logger.error("Invalid timebase variable type. Will use default system timebase")
        #     self.timebase = c_double(0)
        #self._use_hw_timestamps = use_hw_timestamps
        #
        #
        #

    def close(self):
        self.close_device()

    def __dealloc__(self):
        if self.dev_handle != -1:
            self.close_device()

    def get_frame(self):
        pass

    cdef xioctl(self, int request, void *arg):
        cdef int r
        while True:
            r = ioctl(self.dev_handle, request, arg)
            if -1 != r or EINTR != errno:
                break
        return r

    cdef open_device(self):
        cdef stat.struct_stat st
        cdef int dev_handle = -1
        if -1 == stat.stat(self.dev_name, &st):
            raise Exception("Cannot find '%s'. Error: %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
        if not stat.S_ISCHR(st.st_mode):
            raise Exception("%s is no device\n"%self.dev_name)

        dev_handle = fcntl.open(self.dev_name, fcntl.O_RDWR | fcntl.O_NONBLOCK, 0)
        if -1 == dev_handle:
            raise Exception("Cannot open '%s'. Error: %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
        return dev_handle


    cdef close_device(self):
        if unistd.close(self.dev_handle) == -1:
            raise Exception("Could not close device. Handle: '%s'. Error: %d, %s\n"%(self.dev_handle, errno, strerror(errno) ))
        self.dev_handle = -1


    cdef verify_device(self):
        cdef v4l2.v4l2_capability cap
        if self.xioctl(v4l2.VIDIOC_QUERYCAP, &cap) ==-1:
            if EINVAL == errno:
                raise Exception("%s is no V4L2 device\n"%self.dev_name)
            else:
                raise Exception("Error during VIDIOC_QUERYCAP: %d, %s"%(errno, strerror(errno) ))
        
        if not (cap.capabilities & v4l2.V4L2_CAP_VIDEO_CAPTURE):
            raise Exception("%s is no video capture device"%self.dev_name)

        if not (cap.capabilities & v4l2.V4L2_CAP_STREAMING):
            raise Exception("%s does not support streaming i/o"%self.dev_name)


    def stop(self):
        cdef v4l2.v4l2_buf_type buf_type
        if self._camera_streaming:
            buf_type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
            if self.xioctl(v4l2.VIDIOC_STREAMOFF,&buf_type) == -1:
                self.close()
                raise Exception("Could not deinit buffers.")
            else:
                self._camera_streaming = False


    def start(self):
        cdef v4l2.v4l2_buffer buf

        for i in range(len(self.buffers)):
            buf.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
            buf.memory = v4l2.V4L2_MEMORY_MMAP
            buf.index = i
            if self.xioctl(v4l2.VIDIOC_QBUF, &buf) == -1:
                raise Exception('VIDIOC_QBUF')
    
        cdef v4l2.v4l2_buf_type buf_type
        buf_type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        if self.xioctl(v4l2.VIDIOC_STREAMON, &buf_type) ==-1:
            raise Exception("VIDIOC_STREAMON")
        


    def init_buffers(self):
        cdef v4l2.v4l2_requestbuffers req
        cdef v4l2.v4l2_buffer buf

        req.count = 4
        req.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        req.memory = v4l2.V4L2_MEMORY_MMAP

        if self.xioctl(v4l2.VIDIOC_REQBUFS, &req) == -1:
            if EINVAL == errno:
                raise Exception("%s does not support memory mapping"%self.dev_name)
            else:
                raise Exception("VIDIOC_REQBUFS failed")

        if req.count < 2:
            raise Exception("Insufficient buffer memory on %s\n"%self.dev_name)

        self.buffers = []

        for buf_n in range(req.count):
            buf.type        = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
            buf.memory      = v4l2.V4L2_MEMORY_MMAP
            buf.index       = buf_n
            if self.xioctl(v4l2.VIDIOC_QUERYBUF, &buf) == -1:
                raise Exception("VIDIOC_QUERYBUF")

            b = buffer_handle() 
            b.length = buf.length
            b.start = mman.mmap(NULL,#start anywhere
                                buf.length,
                                mman.PROT_READ | mman.PROT_WRITE,#required
                                mman.MAP_SHARED,#recommended
                                self.dev_handle, buf.m.offset)
            if <int>b.start == mman.MAP_FAILED:
                raise Exception("MMAP Error")
            self.buffers.append(b)


    def deinit_buffers(self):
        if self._buffers_initialized:
            for b in self.buffers:
                if (b.start, b.length) ==-1:
                    raise Exception("munmap error")
            self.buffers = []
            self._buffers_initialized = False


    cdef set_format(self):
        cdef v4l2.v4l2_format  format
        format.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        format.fmt.pix.width       = self.frame_size[0]
        format.fmt.pix.height      = self.frame_size[1]
        format.fmt.pix.pixelformat = fourcc_u32(self.transport_format)
        format.fmt.pix.field       = v4l2.V4L2_FIELD_ANY
        if self.xioctl(v4l2.VIDIOC_S_FMT, &format) == -1:
            self.close()
            raise Exception("Could not set v4l2 format")


        cdef v4l2.v4l2_streamparm streamparm
        streamparm.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        streamparm.parm.capture.timeperframe.numerator = self.frame_rate[0]
        streamparm.parm.capture.timeperframe.denominator = self.frame_rate[1]
        if self.xioctl(v4l2.VIDIOC_G_PARM, &streamparm) == -1:
            self._close()
            raise Exception("Could not set v4l2 parameters")
       

    cdef get_format(self):
        cdef v4l2.v4l2_format format
        format.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        if self.xioctl(v4l2.VIDIOC_G_FMT, &format) == -1:
            self.close()
            raise Exception("Could not get v4l2 format")
        else:
            self._frame_size = format.fmt.pix.width,format.fmt.pix.height
            self._transport_format = fourcc_string(format.fmt.pix.pixelformat)

        cdef v4l2.v4l2_streamparm streamparm
        streamparm.type = v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
        if self.xioctl(v4l2.VIDIOC_G_PARM, &streamparm) == -1:
            self._close()
            raise Exception("Could not get v4l2 parameters")
        else:
            self._frame_rate = streamparm.parm.capture.timeperframe.numerator,streamparm.parm.capture.timeperframe.denominator




    property transport_formats:
        def __get__(self):
            cdef v4l2.v4l2_fmtdesc fmt
            if self._transport_formats is None:
                fmt.type =  v4l2.V4L2_BUF_TYPE_VIDEO_CAPTURE
                fmt.index = 0
                formats = []
                while self.xioctl(v4l2.VIDIOC_ENUM_FMT,&fmt)>=0:
                    formats.append( fourcc_string(fmt.pixelformat ) )
                    fmt.index += 1
                logger.debug("Reading Transport formats: %s"%formats)
                self._transport_formats = formats
            return self._transport_formats

        def __set__(self,val):
            raise Exception("Read Only")


    property frame_sizes:
        def __get__(self):
            cdef  v4l2.v4l2_frmsizeenum frmsize
            if self._frame_sizes is None:
                frmsize.pixel_format = fourcc_u32(self.transport_format)
                frmsize.index = 0
                sizes = []
                while self.xioctl(v4l2.VIDIOC_ENUM_FRAMESIZES, &frmsize) >= 0:
                    if frmsize.type == v4l2.V4L2_FRMSIZE_TYPE_DISCRETE:
                        sizes.append((frmsize.discrete.width,frmsize.discrete.height))
                    elif frmsize.type == v4l2.V4L2_FRMSIZE_TYPE_STEPWISE:
                        sizes.append( (frmsize.stepwise.max_width, frmsize.stepwise.max_height) )
                    frmsize.index+=1
                logger.debug("Reading frame sizes@'%s': %s"%(self.transport_format,sizes) )
                self._frame_sizes = sizes 

            return self._frame_sizes

        def __set__(self,val):
            raise Exception("Read Only")


    property frame_rates:
        def __get__(self):
            cdef v4l2.v4l2_frmivalenum interval

            if self._frame_rates is None:
                interval.pixel_format = fourcc_u32(self.transport_format)
                interval.width,interval.height = self.frame_size
                interval.index = 0
                self.xioctl(v4l2.VIDIOC_ENUM_FRAMEINTERVALS,&interval)
                rates = []
                if interval.type == v4l2.V4L2_FRMIVAL_TYPE_DISCRETE:
                    while self.xioctl(v4l2.VIDIOC_ENUM_FRAMEINTERVALS,&interval) >= 0:
                        rates.append((interval.discrete.numerator,interval.discrete.denominator))
                        interval.index += 1
                #non-discreete rates are very seldom, the second and third case should never happen
                elif interval.type == v4l2.V4L2_FRMIVAL_TYPE_STEPWISE or interval.type == v4l2.V4L2_FRMIVAL_TYPE_CONTINUOUS:
                    minval = float(interval.stepwise.min.numerator)/interval.stepwise.min.denominator
                    maxval = float(interval.stepwise.max.numerator)/interval.stepwise.max.denominator
                    if interval.type == v4l2.V4L2_FRMIVAL_TYPE_CONTINUOUS:
                        stepval = 1
                    else:
                        stepval = float(interval.stepwise.step.numerator)/interval.stepwise.step.denominator
                    rates = range(minval,maxval,stepval)
                logger.debug("Reading frame rates@'%s'@%s: %s"%(self.transport_format,self.frame_size,rates) )
                self._frame_rates = rates

            return self._frame_rates

        def __set__(self,val):
            raise Exception("Read Only")


    property transport_format:
        def __get__(self):
            return self._transport_format

        def __set__(self,val):
            self._transport_format = val
            self._frame_sizes = None
            self._frame_rates = None
            self.stop()
            self.deinit_buffers()
            self.set_format
            self.get_format()


    property frame_size:
        def __get__(self):
            return self._frame_size
        def __set__(self,val):
            self._frame_size = val
            self._frame_rates = None
            self.stop()
            self.deinit_buffers()
            self.set_format()
            self.get_format()

    property frame_rate:
        def __get__(self):
            return self._frame_rate
        def __set__(self,val):
            self._frame_rate = val
            self.stop()
            self.deinit_buffers()
            self.set_format()
            self.get_format()
