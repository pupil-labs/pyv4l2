import cython

from posix cimport fcntl,unistd, stat, time
from posix.ioctl cimport ioctl
from libc.errno cimport errno,EINTR,EINVAL
from libc.string cimport strerror
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


cdef class Capture:
    cdef int dev_handle 
    cdef char *dev_name

    def __cinit__(self,char *dev_name):
        pass

    def __init__(self,char *dev_name):
        self.dev_name = dev_name
        self.dev_handle = self.open_device()
        self.verify_device()

        self._transport_formats = None
        self._current_format = None
        self._frame_rates = None
        self._current_rate = None
        self._frame_sizes = None
        self._current_size = None

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
            raise Exception("Cannot identify '%s': %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
        if not stat.S_ISCHR(st.st_mode):
            raise Exception("%s is no device\n"%self.dev_name)

        dev_handle = fcntl.open(self.dev_name, fcntl.O_RDWR | fcntl.O_NONBLOCK, 0)
        if -1 == dev_handle:
            raise Exception("Cannot open '%s': %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
        return dev_handle


    cdef close_device(self):
        if unistd.close(self.dev_handle) == -1:
            raise Exception("Could not close device. Handle: '%s': %d, %s\n"%(self.dev_handle, errno, strerror(errno) ))
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


    cdef stop(self):
        pass

    cdef start(self):
        pass

    cdef init_buffers(self):
        pass

    cdef deinit_buffers(self):
        pass


    property transport_formats:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        raise Exception("Read Only")

    property transport_format:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        pass

    property frame_rates:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        raise Exception("Read Only")

    property frame_rate:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        pass

    property sizes:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        raise Exception("Read Only")

    property size:
    def __get__(self):
        return self._x,self._y
    def __set__(self,val):
        pass