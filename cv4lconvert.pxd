from cv4l2 cimport v4l2_format,v4l2_frmsizeenum,v4l2_frmivalenum,v4l2_fmtdesc

cdef extern from  "libv4lconvert.h":
    
    cdef struct v4lconvert_data:
        pass
    
    v4lconvert_data *v4lconvert_create(int fd)
    void v4lconvert_destroy(v4lconvert_data *data)
    
    # When doing flipping / rotating / video-processing, only supported
    # destination formats can be used (as flipping / rotating / video-processing
    # is not supported on other formats). This function can be used to query
    # if that is the case. 
    int v4lconvert_supported_dst_fmt_only(v4lconvert_data *data)
    # With regards to dest_fmt just like VIDIOC_TRY_FMT, except that the try
    # format will succeed and return the requested V4L2_PIX_FMT_foo in dest_fmt if
    # the cam has a format from which v4lconvert can convert to dest_fmt.
    # The real format to which the cam should be set is returned through src_fmt
    # when not NULL.
    # Note that just like the real VIDIOC_TRY_FMT this function will change the
    # dest_fmt when not supported. This includes changing it to a supported
    # destination format when trying a native format of the camera and
    # v4lconvert_supported_dst_fmt_only() returns true.
    int v4lconvert_try_format(v4lconvert_data *data,
        v4l2_format *dest_fmt, # in / out
        v4l2_format *src_fmt) # out



    # Like VIDIOC_ENUM_FMT, but the emulated formats are added at the end of the
    # list, except if flipping / processing is active for the device, then only
    # supported destination formats are listed 
    int v4lconvert_enum_fmt(v4lconvert_data *data, v4l2_fmtdesc *fmt)

    # Is conversion necessary or can the app use the data directly?
    int v4lconvert_needs_conversion(v4lconvert_data *data,
        const v4l2_format *src_fmt,  
        const v4l2_format *dest_fmt)

    # return value of -1 on error, otherwise the amount of bytes written to
    # dest 
    int v4lconvert_convert(v4lconvert_data *data,
        const v4l2_format *src_fmt,  #in 
        const v4l2_format *dest_fmt, #in 
        unsigned char *src, int src_size, unsigned char *dest, int dest_size)

    # get a string describing the last error 
    const char *v4lconvert_get_error_message(v4lconvert_data *data)

    # Just like VIDIOC_ENUM_FRAMESIZE, except that the framesizes of emulated
    # formats can be enumerated as well.
    int v4lconvert_enum_framesizes(v4lconvert_data *data,
        v4l2_frmsizeenum *frmsize)

    # Just like VIDIOC_ENUM_FRAMEINTERVALS, except that the intervals of emulated
    # formats can be enumerated as well.
    int v4lconvert_enum_frameintervals(v4lconvert_data *data,
        v4l2_frmivalenum *frmival)

    # Pass calls to query, get and set video controls to the libv4lcontrol class 
    int v4lconvert_vidioc_queryctrl(v4lconvert_data *data,
        void *arg)
    int v4lconvert_vidioc_g_ctrl(v4lconvert_data *data,
        void *arg)
    int v4lconvert_vidioc_s_ctrl(v4lconvert_data *data,
        void *arg)

    # Is the passed in pixelformat supported as destination format? 
    int v4lconvert_supported_dst_format(unsigned int pixelformat)

    # Get/set the no fps libv4lconvert uses to decide if a compressed format
    # must be used as src fmt to stay within the bus bandwidth 
    int v4lconvert_get_fps(v4lconvert_data *data)
    void v4lconvert_set_fps(v4lconvert_data *data, int fps)