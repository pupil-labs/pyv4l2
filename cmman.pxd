cdef extern from "sys/mman.h":
    ctypedef long off_t

    void *mmap(void *addr, size_t len, int prot, int flags, int fd, off_t offset)
    int   munmap(void *addr, size_t len)

    enum:
        PROT_READ
        PROT_WRITE
        MAP_FILE
        MAP_SHARED
    enum: MAP_FAILED 