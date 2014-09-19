from posix.time cimport timeval

cdef extern from 'sys/select.h':

	ctypedef struct fd_set:
		pass

	void FD_CLR(int fd, fd_set *set);
	int  FD_ISSET(int fd, fd_set *set);
	void FD_SET(int fd, fd_set *set);
	void FD_ZERO(fd_set *set);
	int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds,  timeval *timeout)