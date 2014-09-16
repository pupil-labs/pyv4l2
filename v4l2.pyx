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


cdef class Capture:
	cdef int fd 
	cdef char *dev_name
	def __cinit__(self,char *dev_name):
		pass

	def __init__(self,char *dev_name):
		self.dev_name = dev_name
		self.fd = self.open_device()
		self.verify_device()


	def __dealloc__(self):
		self.close_device()

	cdef xioctl(self, int request, void *arg):
		cdef int r
		while True:
			r = ioctl(self.fd, request, arg)
			if -1 != r or EINTR != errno:
				break
		return r

	cdef open_device(self):
		cdef stat.struct_stat st
		cdef int fd = -1
		if -1 == stat.stat(self.dev_name, &st):
			raise Exception("Cannot identify '%s': %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
		if not stat.S_ISCHR(st.st_mode):
			raise Exception("%s is no device\n"%self.dev_name)

		fd = fcntl.open(self.dev_name, fcntl.O_RDWR | fcntl.O_NONBLOCK, 0)
		if -1 == fd:
			raise Exception("Cannot open '%s': %d, %s\n"%(self.dev_name, errno, strerror(errno) ))
		return fd


	cdef close_device(self):
		if unistd.close(self.fd) == -1:
			raise Exception("Could not close device. Handle: '%s': %d, %s\n"%(self.fd, errno, strerror(errno) ))
		self.fd = -1


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