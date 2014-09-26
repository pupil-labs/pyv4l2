
from posix.time cimport timeval,timespec

cdef extern from  "linux/videodev2.h":


    ctypedef unsigned char           __u8
    ctypedef signed char             __s8
    ctypedef unsigned short          __u16
    ctypedef signed short            __s16
    ctypedef unsigned int            __u32
    ctypedef signed int              __s32
    ctypedef unsigned long long int  __u64
    ctypedef signed long long int    __s64


    __u32 v4l2_fourcc(char a,char b,char c,char d)


    enum: V4L2_CAP_VIDEO_CAPTURE
    enum: V4L2_CAP_VIDEO_OUTPUT
    enum: V4L2_CAP_VIDEO_OVERLAY
    enum: V4L2_CAP_VBI_CAPTURE
    enum: V4L2_CAP_VBI_OUTPUT
    enum: V4L2_CAP_SLICED_VBI_CAPTURE
    enum: V4L2_CAP_SLICED_VBI_OUTPUT
    enum: V4L2_CAP_RDS_CAPTURE
    enum: V4L2_CAP_VIDEO_OUTPUT_OVERLAY
    enum: V4L2_CAP_HW_FREQ_SEEK
    enum: V4L2_CAP_RDS_OUTPUT
    enum: V4L2_CAP_VIDEO_CAPTURE_MPLANE
    enum: V4L2_CAP_VIDEO_OUTPUT_MPLANE
    enum: V4L2_CAP_TUNER
    enum: V4L2_CAP_AUDIO
    enum: V4L2_CAP_RADIO
    enum: V4L2_CAP_MODULATOR
    enum: V4L2_CAP_READWRITE
    enum: V4L2_CAP_ASYNCIO
    enum: V4L2_CAP_STREAMING

    enum: VIDIOC_QUERYCAP     
    enum: VIDIOC_RESERVED
    enum: VIDIOC_ENUM_FMT
    enum: VIDIOC_G_FMT
    enum: VIDIOC_S_FMT
    enum: VIDIOC_REQBUFS
    enum: VIDIOC_QUERYBUF
    enum: VIDIOC_G_FBUF
    enum: VIDIOC_S_FBUF
    enum: VIDIOC_OVERLAY
    enum: VIDIOC_QBUF
    enum: VIDIOC_DQBUF
    enum: VIDIOC_STREAMON
    enum: VIDIOC_STREAMOFF
    enum: VIDIOC_G_PARM
    enum: VIDIOC_S_PARM
    enum: VIDIOC_G_STD
    enum: VIDIOC_S_STD
    enum: VIDIOC_ENUMSTD
    enum: VIDIOC_ENUMINPUT
    enum: VIDIOC_G_CTRL
    enum: VIDIOC_S_CTRL
    enum: VIDIOC_G_TUNER
    enum: VIDIOC_S_TUNER
    enum: VIDIOC_G_AUDIO
    enum: VIDIOC_S_AUDIO
    enum: VIDIOC_QUERYCTRL
    enum: VIDIOC_QUERYMENU
    enum: VIDIOC_G_INPUT
    enum: VIDIOC_S_INPUT
    enum: VIDIOC_G_OUTPUT
    enum: VIDIOC_S_OUTPUT
    enum: VIDIOC_ENUMOUTPUT
    enum: VIDIOC_G_AUDOUT
    enum: VIDIOC_S_AUDOUT
    enum: VIDIOC_G_MODULATOR
    enum: VIDIOC_S_MODULATOR
    enum: VIDIOC_G_FREQUENCY
    enum: VIDIOC_S_FREQUENCY
    enum: VIDIOC_CROPCAP
    enum: VIDIOC_G_CROP
    enum: VIDIOC_S_CROP
    enum: VIDIOC_G_JPEGCOMP
    enum: VIDIOC_S_JPEGCOMP
    enum: VIDIOC_QUERYSTD
    enum: VIDIOC_TRY_FMT
    enum: VIDIOC_ENUMAUDIO
    enum: VIDIOC_ENUMAUDOUT
    enum: VIDIOC_G_PRIORITY
    enum: VIDIOC_S_PRIORITY
    enum: VIDIOC_G_SLICED_VBI_CAP
    enum: VIDIOC_LOG_STATUS
    enum: VIDIOC_G_EXT_CTRLS
    enum: VIDIOC_S_EXT_CTRLS
    enum: VIDIOC_TRY_EXT_CTRLS
    enum: VIDIOC_ENUM_FRAMESIZES
    enum: VIDIOC_ENUM_FRAMEINTERVALS
    enum: VIDIOC_G_ENC_INDEX
    enum: VIDIOC_ENCODER_CMD
    enum: VIDIOC_TRY_ENCODER_CMD
    enum: VIDIOC_DBG_S_REGISTER
    enum: VIDIOC_DBG_G_REGISTER
    enum: VIDIOC_DBG_G_CHIP_IDENT
    enum: VIDIOC_S_HW_FREQ_SEEK
    enum: VIDIOC_ENUM_DV_PRESETS
    enum: VIDIOC_S_DV_PRESET
    enum: VIDIOC_G_DV_PRESET
    enum: VIDIOC_QUERY_DV_PRESET
    enum: VIDIOC_S_DV_TIMINGS
    enum: VIDIOC_G_DV_TIMINGS
    enum: VIDIOC_DQEVENT
    enum: VIDIOC_SUBSCRIBE_EVENT
    enum: VIDIOC_UNSUBSCRIBE_EVENT

    enum: V4L2_PIX_FMT_RGB332
    enum: V4L2_PIX_FMT_RGB444
    enum: V4L2_PIX_FMT_RGB555
    enum: V4L2_PIX_FMT_RGB565
    enum: V4L2_PIX_FMT_RGB555X
    enum: V4L2_PIX_FMT_RGB565X
    enum: V4L2_PIX_FMT_BGR666
    enum: V4L2_PIX_FMT_BGR24
    enum: V4L2_PIX_FMT_RGB24
    enum: V4L2_PIX_FMT_BGR32
    enum: V4L2_PIX_FMT_RGB32
    enum: V4L2_PIX_FMT_GREY
    enum: V4L2_PIX_FMT_Y4
    enum: V4L2_PIX_FMT_Y6
    enum: V4L2_PIX_FMT_Y10
    enum: V4L2_PIX_FMT_Y12
    enum: V4L2_PIX_FMT_Y16
    enum: V4L2_PIX_FMT_Y10BPACK
    enum: V4L2_PIX_FMT_PAL8
    enum: V4L2_PIX_FMT_YVU410
    enum: V4L2_PIX_FMT_YVU420
    enum: V4L2_PIX_FMT_YUYV
    enum: V4L2_PIX_FMT_YYUV
    enum: V4L2_PIX_FMT_YVYU
    enum: V4L2_PIX_FMT_UYVY
    enum: V4L2_PIX_FMT_VYUY
    enum: V4L2_PIX_FMT_YUV422P
    enum: V4L2_PIX_FMT_YUV411P
    enum: V4L2_PIX_FMT_Y41P
    enum: V4L2_PIX_FMT_YUV444
    enum: V4L2_PIX_FMT_YUV555
    enum: V4L2_PIX_FMT_YUV565
    enum: V4L2_PIX_FMT_YUV32
    enum: V4L2_PIX_FMT_YUV410
    enum: V4L2_PIX_FMT_YUV420
    enum: V4L2_PIX_FMT_HI240
    enum: V4L2_PIX_FMT_HM12
    enum: V4L2_PIX_FMT_M420
    enum: V4L2_PIX_FMT_NV12
    enum: V4L2_PIX_FMT_NV21
    enum: V4L2_PIX_FMT_NV16
    enum: V4L2_PIX_FMT_NV61
    enum: V4L2_PIX_FMT_NV12M
    enum: V4L2_PIX_FMT_NV12MT
    enum: V4L2_PIX_FMT_YUV420M
    enum: V4L2_PIX_FMT_SBGGR8
    enum: V4L2_PIX_FMT_SGBRG8
    enum: V4L2_PIX_FMT_SGRBG8
    enum: V4L2_PIX_FMT_SRGGB8
    enum: V4L2_PIX_FMT_SBGGR10
    enum: V4L2_PIX_FMT_SGBRG10
    enum: V4L2_PIX_FMT_SGRBG10
    enum: V4L2_PIX_FMT_SRGGB10
    enum: V4L2_PIX_FMT_SBGGR12
    enum: V4L2_PIX_FMT_SGBRG12
    enum: V4L2_PIX_FMT_SGRBG12
    enum: V4L2_PIX_FMT_SRGGB12
    enum: V4L2_PIX_FMT_SGRBG10DPCM8
    enum: V4L2_PIX_FMT_SBGGR16
    enum: V4L2_PIX_FMT_MJPEG
    enum: V4L2_PIX_FMT_JPEG
    enum: V4L2_PIX_FMT_DV
    enum: V4L2_PIX_FMT_MPEG
    enum: V4L2_PIX_FMT_H264
    enum: V4L2_PIX_FMT_H264_NO_SC
    enum: V4L2_PIX_FMT_H263
    enum: V4L2_PIX_FMT_MPEG1
    enum: V4L2_PIX_FMT_MPEG2
    enum: V4L2_PIX_FMT_MPEG4
    enum: V4L2_PIX_FMT_XVID
    enum: V4L2_PIX_FMT_VC1_ANNEX_G
    enum: V4L2_PIX_FMT_VC1_ANNEX_L
    enum: V4L2_PIX_FMT_CPIA1
    enum: V4L2_PIX_FMT_WNVA
    enum: V4L2_PIX_FMT_SN9C10X
    enum: V4L2_PIX_FMT_SN9C20X_I420
    enum: V4L2_PIX_FMT_PWC1
    enum: V4L2_PIX_FMT_PWC2
    enum: V4L2_PIX_FMT_ET61X251
    enum: V4L2_PIX_FMT_SPCA501
    enum: V4L2_PIX_FMT_SPCA505
    enum: V4L2_PIX_FMT_SPCA508
    enum: V4L2_PIX_FMT_SPCA561
    enum: V4L2_PIX_FMT_PAC207
    enum: V4L2_PIX_FMT_MR97310A
    enum: V4L2_PIX_FMT_SN9C2028
    enum: V4L2_PIX_FMT_SQ905C
    enum: V4L2_PIX_FMT_PJPG
    enum: V4L2_PIX_FMT_OV511
    enum: V4L2_PIX_FMT_OV518
    enum: V4L2_PIX_FMT_STV0680
    enum: V4L2_PIX_FMT_TM6000
    enum: V4L2_PIX_FMT_CIT_YYVYUY
    enum: V4L2_PIX_FMT_KONICA420
    enum: V4L2_PIX_FMT_JPGL
    enum: V4L2_PIX_FMT_SE401

    cdef enum v4l2_field:
        V4L2_FIELD_ANY
        V4L2_FIELD_NONE
        V4L2_FIELD_TOP
        V4L2_FIELD_BOTTOM
        V4L2_FIELD_INTERLACED
        V4L2_FIELD_SEQ_TB
        V4L2_FIELD_SEQ_BT
        V4L2_FIELD_ALTERNATE
        V4L2_FIELD_INTERLACED_TB
        V4L2_FIELD_INTERLACED_BT

    cdef enum v4l2_buf_type:
        V4L2_BUF_TYPE_VIDEO_CAPTURE
        V4L2_BUF_TYPE_VIDEO_OUTPUT
        V4L2_BUF_TYPE_VIDEO_OVERLAY
        V4L2_BUF_TYPE_VBI_CAPTURE
        V4L2_BUF_TYPE_VBI_OUTPUT
        V4L2_BUF_TYPE_SLICED_VBI_CAPTURE
        V4L2_BUF_TYPE_SLICED_VBI_OUTPUT
        V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY
        V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
        V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
        V4L2_BUF_TYPE_PRIVATE

    cdef enum v4l2_tuner_type:
        V4L2_TUNER_RADIO
        V4L2_TUNER_ANALOG_TV
        V4L2_TUNER_DIGITAL_TV

    cdef enum v4l2_memory:
        V4L2_MEMORY_MMAP
        V4L2_MEMORY_USERPTR
        V4L2_MEMORY_OVERLAY

    cdef enum v4l2_colorspace:
        V4L2_COLORSPACE_SMPTE170M
        V4L2_COLORSPACE_SMPTE240M
        V4L2_COLORSPACE_REC709
        V4L2_COLORSPACE_BT878
        V4L2_COLORSPACE_470_SYSTEM_M
        V4L2_COLORSPACE_470_SYSTEM_BG
        V4L2_COLORSPACE_JPEG
        V4L2_COLORSPACE_SRGB

    cdef enum v4l2_priority:
        V4L2_PRIORITY_UNSET
        V4L2_PRIORITY_BACKGROUND
        V4L2_PRIORITY_INTERACTIVE
        V4L2_PRIORITY_RECORD
        V4L2_PRIORITY_DEFAULT

    cdef struct v4l2_rect:
        __s32 left
        __s32 top
        __s32 width
        __s32 height

    cdef struct v4l2_fract:
        __u32 numerator
        __u32 denominator

    cdef struct v4l2_capability:
        __u8 driver[16]
        __u8 card[32]
        __u8 bus_info[32]
        __u32 version
        __u32 capabilities
        __u32 reserved[4]

    cdef struct v4l2_pix_format:
        __u32 width
        __u32 height
        __u32 pixelformat
        v4l2_field field
        __u32 bytesperline
        __u32 sizeimage
        v4l2_colorspace colorspace
        __u32 priv

    cdef struct v4l2_fmtdesc:
        __u32 index
        v4l2_buf_type type
        __u32 flags
        __u8 description[32]
        __u32 pixelformat
        __u32 reserved[4]

    cdef enum v4l2_frmsizetypes:
        V4L2_FRMSIZE_TYPE_DISCRETE
        V4L2_FRMSIZE_TYPE_CONTINUOUS
        V4L2_FRMSIZE_TYPE_STEPWISE

    cdef struct v4l2_frmsize_discrete:
        __u32 width
        __u32 height

    cdef struct v4l2_frmsize_stepwise:
        __u32 min_width
        __u32 max_width
        __u32 step_width
        __u32 min_height
        __u32 max_height
        __u32 step_height

    # cdef union __v4l2_frmsizeenum_N16v4l2_frmsizeenum3DOT_5E:
    #     v4l2_frmsize_discrete discrete
    #     v4l2_frmsize_stepwise stepwise

    cdef struct v4l2_frmsizeenum:
        __u32 index
        __u32 pixel_format
        __u32 type
        # __v4l2_frmsizeenum_N16v4l2_frmsizeenum3DOT_5E_t
        v4l2_frmsize_discrete discrete
        v4l2_frmsize_stepwise stepwise
        __u32 reserved[2]

    cdef enum v4l2_frmivaltypes:
        V4L2_FRMIVAL_TYPE_DISCRETE
        V4L2_FRMIVAL_TYPE_CONTINUOUS
        V4L2_FRMIVAL_TYPE_STEPWISE

    cdef struct v4l2_frmival_stepwise:
        v4l2_fract min
        v4l2_fract max
        v4l2_fract step

    # cdef union __v4l2_frmivalenum_N16v4l2_frmivalenum3DOT_6E:
    #     v4l2_fract discrete
    #     v4l2_frmival_stepwise stepwise

    cdef struct v4l2_frmivalenum:
        __u32 index
        __u32 pixel_format
        __u32 width
        __u32 height
        __u32 type
        # __v4l2_frmivalenum_N16v4l2_frmivalenum3DOT_6E_t
        v4l2_fract discrete
        v4l2_frmival_stepwise stepwise
        __u32 reserved[2]


    cdef struct v4l2_timecode:
        __u32 type
        __u32 flags
        __u8 frames
        __u8 seconds
        __u8 minutes
        __u8 hours
        __u8 userbits[4]

    cdef struct v4l2_jpegcompression:
        int quality
        int APPn
        int APP_len
        char APP_data[60]
        int COM_len
        char COM_data[60]
        __u32 jpeg_markers

    cdef struct v4l2_requestbuffers:
        __u32 count
        v4l2_buf_type type
        v4l2_memory memory
        __u32 reserved[2]

    cdef union __v4l2_plane_N10v4l2_plane3DOT_7E_t:
        __u32 mem_offset
        long unsigned int userptr

    cdef struct v4l2_plane:
        __u32 bytesused
        __u32 length
        __v4l2_plane_N10v4l2_plane3DOT_7E_t m
        __u32 data_offset
        __u32 reserved[11]

    cdef union __v4l2_buffer_N11v4l2_buffer3DOT_8E_t:
        __u32 offset
        long unsigned int userptr
        v4l2_plane *planes

    cdef struct v4l2_buffer:
        __u32 index
        v4l2_buf_type type
        __u32 bytesused
        __u32 flags
        v4l2_field field
        timeval timestamp
        v4l2_timecode timecode
        __u32 sequence
        v4l2_memory memory
        __v4l2_buffer_N11v4l2_buffer3DOT_8E_t m
        __u32 length
        __u32 input
        __u32 reserved

    cdef struct v4l2_framebuffer:
        __u32 capability
        __u32 flags
        void *base
        v4l2_pix_format fmt

    cdef struct v4l2_clip:
        v4l2_rect c
        v4l2_clip *next

    cdef struct v4l2_window:
        v4l2_rect w
        v4l2_field field
        __u32 chromakey
        v4l2_clip *clips
        __u32 clipcount
        void *bitmap
        __u8 global_alpha

    cdef struct v4l2_captureparm:
        __u32 capability
        __u32 capturemode
        v4l2_fract timeperframe
        __u32 extendedmode
        __u32 readbuffers
        __u32 reserved[4]

    cdef struct v4l2_outputparm:
        __u32 capability
        __u32 outputmode
        v4l2_fract timeperframe
        __u32 extendedmode
        __u32 writebuffers
        __u32 reserved[4]

    cdef struct v4l2_cropcap:
        v4l2_buf_type type
        v4l2_rect bounds
        v4l2_rect defrect
        v4l2_fract pixelaspect

    cdef struct v4l2_crop:
        v4l2_buf_type type
        v4l2_rect c

    ctypedef __u64 v4l2_std_id

    cdef struct v4l2_standard:
        __u32 index
        v4l2_std_id id
        __u8 name[24]
        v4l2_fract frameperiod
        __u32 framelines
        __u32 reserved[4]

    cdef struct v4l2_dv_preset:
        __u32 preset
        __u32 reserved[4]

    cdef struct v4l2_dv_enum_preset:
        __u32 index
        __u32 preset
        __u8 name[32]
        __u32 width
        __u32 height
        __u32 reserved[4]

    cdef struct v4l2_bt_timings:
        __u32 width
        __u32 height
        __u32 interlaced
        __u32 polarities
        __u64 pixelclock
        __u32 hfrontporch
        __u32 hsync
        __u32 hbackporch
        __u32 vfrontporch
        __u32 vsync
        __u32 vbackporch
        __u32 il_vfrontporch
        __u32 il_vsync
        __u32 il_vbackporch
        __u32 reserved[16]

    # cdef union __v4l2_dv_timings_N15v4l2_dv_timings3DOT_9E:
    #     v4l2_bt_timings bt
    #     __u32 reserved[32]

    cdef struct v4l2_dv_timings:
        __u32 type
        # __v4l2_dv_timings_N15v4l2_dv_timings3DOT_9E_t
        v4l2_bt_timings bt
        __u32 reserved[32]

    cdef struct v4l2_input:
        __u32 index
        __u8 name[32]
        __u32 type
        __u32 audioset
        __u32 tuner
        v4l2_std_id std
        __u32 status
        __u32 capabilities
        __u32 reserved[3]

    cdef struct v4l2_output:
        __u32 index
        __u8 name[32]
        __u32 type
        __u32 audioset
        __u32 modulator
        v4l2_std_id std
        __u32 capabilities
        __u32 reserved[3]

    cdef struct v4l2_control:
        __u32 id
        __s32 value

    # cdef union __v4l2_ext_control_N16v4l2_ext_control4DOT_10E:
    #     __s32 value
    #     __s64 value64
    #     char *string

    cdef struct v4l2_ext_control:
        __u32 id
        __u32 size
        __u32 reserved2[1]
        # __v4l2_ext_control_N16v4l2_ext_control4DOT_10E_t
        __s32 value
        __s64 value64
        char *string

    cdef struct v4l2_ext_controls:
        __u32 ctrl_class
        __u32 count
        __u32 error_idx
        __u32 reserved[2]
        v4l2_ext_control *controls

    enum: V4L2_CTRL_CLASS_USER
    enum: V4L2_CTRL_CLASS_MPEG
    enum: V4L2_CTRL_CLASS_CAMERA 
    enum: V4L2_CTRL_CLASS_FM_TX
    enum: V4L2_CTRL_CLASS_FLASH

    enum: V4L2_CTRL_ID_MASK         
    const int V4L2_CTRL_ID2CLASS(int id)  
    const int V4L2_CTRL_DRIVER_PRIV(int id) 

    cdef enum v4l2_ctrl_type:
        V4L2_CTRL_TYPE_INTEGER
        V4L2_CTRL_TYPE_BOOLEAN
        V4L2_CTRL_TYPE_MENU
        V4L2_CTRL_TYPE_BUTTON
        V4L2_CTRL_TYPE_INTEGER64
        V4L2_CTRL_TYPE_CTRL_CLASS
        V4L2_CTRL_TYPE_STRING
        V4L2_CTRL_TYPE_BITMASK

    cdef struct v4l2_queryctrl:
        __u32 id
        v4l2_ctrl_type type
        __u8 name[32]
        __s32 minimum
        __s32 maximum
        __s32 step
        __s32 default_value
        __u32 flags
        __u32 reserved[2]

    cdef struct v4l2_querymenu:
        __u32 id
        __u32 index
        __u8 name[32]
        __u32 reserved

    cdef enum v4l2_power_line_frequency:
        V4L2_CID_POWER_LINE_FREQUENCY_DISABLED
        V4L2_CID_POWER_LINE_FREQUENCY_50HZ
        V4L2_CID_POWER_LINE_FREQUENCY_60HZ
        V4L2_CID_POWER_LINE_FREQUENCY_AUTO

    cdef enum v4l2_colorfx:
        V4L2_COLORFX_NONE
        V4L2_COLORFX_BW
        V4L2_COLORFX_SEPIA
        V4L2_COLORFX_NEGATIVE
        V4L2_COLORFX_EMBOSS
        V4L2_COLORFX_SKETCH
        V4L2_COLORFX_SKY_BLUE
        V4L2_COLORFX_GRASS_GREEN
        V4L2_COLORFX_SKIN_WHITEN
        V4L2_COLORFX_VIVID

    cdef enum v4l2_mpeg_stream_type:
        V4L2_MPEG_STREAM_TYPE_MPEG2_PS
        V4L2_MPEG_STREAM_TYPE_MPEG2_TS
        V4L2_MPEG_STREAM_TYPE_MPEG1_SS
        V4L2_MPEG_STREAM_TYPE_MPEG2_DVD
        V4L2_MPEG_STREAM_TYPE_MPEG1_VCD
        V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD

    cdef enum v4l2_mpeg_stream_vbi_fmt:
        V4L2_MPEG_STREAM_VBI_FMT_NONE
        V4L2_MPEG_STREAM_VBI_FMT_IVTV

    cdef enum v4l2_mpeg_audio_sampling_freq:
        V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100
        V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000
        V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000

    cdef enum v4l2_mpeg_audio_encoding:
        V4L2_MPEG_AUDIO_ENCODING_LAYER_1
        V4L2_MPEG_AUDIO_ENCODING_LAYER_2
        V4L2_MPEG_AUDIO_ENCODING_LAYER_3
        V4L2_MPEG_AUDIO_ENCODING_AAC
        V4L2_MPEG_AUDIO_ENCODING_AC3

    cdef enum v4l2_mpeg_audio_l1_bitrate:
        V4L2_MPEG_AUDIO_L1_BITRATE_32K
        V4L2_MPEG_AUDIO_L1_BITRATE_64K
        V4L2_MPEG_AUDIO_L1_BITRATE_96K
        V4L2_MPEG_AUDIO_L1_BITRATE_128K
        V4L2_MPEG_AUDIO_L1_BITRATE_160K
        V4L2_MPEG_AUDIO_L1_BITRATE_192K
        V4L2_MPEG_AUDIO_L1_BITRATE_224K
        V4L2_MPEG_AUDIO_L1_BITRATE_256K
        V4L2_MPEG_AUDIO_L1_BITRATE_288K
        V4L2_MPEG_AUDIO_L1_BITRATE_320K
        V4L2_MPEG_AUDIO_L1_BITRATE_352K
        V4L2_MPEG_AUDIO_L1_BITRATE_384K
        V4L2_MPEG_AUDIO_L1_BITRATE_416K
        V4L2_MPEG_AUDIO_L1_BITRATE_448K

    cdef enum v4l2_mpeg_audio_l2_bitrate:
        V4L2_MPEG_AUDIO_L2_BITRATE_32K
        V4L2_MPEG_AUDIO_L2_BITRATE_48K
        V4L2_MPEG_AUDIO_L2_BITRATE_56K
        V4L2_MPEG_AUDIO_L2_BITRATE_64K
        V4L2_MPEG_AUDIO_L2_BITRATE_80K
        V4L2_MPEG_AUDIO_L2_BITRATE_96K
        V4L2_MPEG_AUDIO_L2_BITRATE_112K
        V4L2_MPEG_AUDIO_L2_BITRATE_128K
        V4L2_MPEG_AUDIO_L2_BITRATE_160K
        V4L2_MPEG_AUDIO_L2_BITRATE_192K
        V4L2_MPEG_AUDIO_L2_BITRATE_224K
        V4L2_MPEG_AUDIO_L2_BITRATE_256K
        V4L2_MPEG_AUDIO_L2_BITRATE_320K
        V4L2_MPEG_AUDIO_L2_BITRATE_384K

    cdef enum v4l2_mpeg_audio_l3_bitrate:
        V4L2_MPEG_AUDIO_L3_BITRATE_32K
        V4L2_MPEG_AUDIO_L3_BITRATE_40K
        V4L2_MPEG_AUDIO_L3_BITRATE_48K
        V4L2_MPEG_AUDIO_L3_BITRATE_56K
        V4L2_MPEG_AUDIO_L3_BITRATE_64K
        V4L2_MPEG_AUDIO_L3_BITRATE_80K
        V4L2_MPEG_AUDIO_L3_BITRATE_96K
        V4L2_MPEG_AUDIO_L3_BITRATE_112K
        V4L2_MPEG_AUDIO_L3_BITRATE_128K
        V4L2_MPEG_AUDIO_L3_BITRATE_160K
        V4L2_MPEG_AUDIO_L3_BITRATE_192K
        V4L2_MPEG_AUDIO_L3_BITRATE_224K
        V4L2_MPEG_AUDIO_L3_BITRATE_256K
        V4L2_MPEG_AUDIO_L3_BITRATE_320K

    cdef enum v4l2_mpeg_audio_mode:
        V4L2_MPEG_AUDIO_MODE_STEREO
        V4L2_MPEG_AUDIO_MODE_JOINT_STEREO
        V4L2_MPEG_AUDIO_MODE_DUAL
        V4L2_MPEG_AUDIO_MODE_MONO

    cdef enum v4l2_mpeg_audio_mode_extension:
        V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4
        V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_8
        V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_12
        V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16

    cdef enum v4l2_mpeg_audio_emphasis:
        V4L2_MPEG_AUDIO_EMPHASIS_NONE
        V4L2_MPEG_AUDIO_EMPHASIS_50_DIV_15_uS
        V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17

    cdef enum v4l2_mpeg_audio_crc:
        V4L2_MPEG_AUDIO_CRC_NONE
        V4L2_MPEG_AUDIO_CRC_CRC16

    cdef enum v4l2_mpeg_audio_ac3_bitrate:
        V4L2_MPEG_AUDIO_AC3_BITRATE_32K
        V4L2_MPEG_AUDIO_AC3_BITRATE_40K
        V4L2_MPEG_AUDIO_AC3_BITRATE_48K
        V4L2_MPEG_AUDIO_AC3_BITRATE_56K
        V4L2_MPEG_AUDIO_AC3_BITRATE_64K
        V4L2_MPEG_AUDIO_AC3_BITRATE_80K
        V4L2_MPEG_AUDIO_AC3_BITRATE_96K
        V4L2_MPEG_AUDIO_AC3_BITRATE_112K
        V4L2_MPEG_AUDIO_AC3_BITRATE_128K
        V4L2_MPEG_AUDIO_AC3_BITRATE_160K
        V4L2_MPEG_AUDIO_AC3_BITRATE_192K
        V4L2_MPEG_AUDIO_AC3_BITRATE_224K
        V4L2_MPEG_AUDIO_AC3_BITRATE_256K
        V4L2_MPEG_AUDIO_AC3_BITRATE_320K
        V4L2_MPEG_AUDIO_AC3_BITRATE_384K
        V4L2_MPEG_AUDIO_AC3_BITRATE_448K
        V4L2_MPEG_AUDIO_AC3_BITRATE_512K
        V4L2_MPEG_AUDIO_AC3_BITRATE_576K
        V4L2_MPEG_AUDIO_AC3_BITRATE_640K

    cdef enum v4l2_mpeg_video_encoding:
        V4L2_MPEG_VIDEO_ENCODING_MPEG_1
        V4L2_MPEG_VIDEO_ENCODING_MPEG_2
        V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC

    cdef enum v4l2_mpeg_video_aspect:
        V4L2_MPEG_VIDEO_ASPECT_1x1
        V4L2_MPEG_VIDEO_ASPECT_4x3
        V4L2_MPEG_VIDEO_ASPECT_16x9
        V4L2_MPEG_VIDEO_ASPECT_221x100

    cdef enum v4l2_mpeg_video_bitrate_mode:
        V4L2_MPEG_VIDEO_BITRATE_MODE_VBR
        V4L2_MPEG_VIDEO_BITRATE_MODE_CBR

    cdef enum v4l2_mpeg_video_header_mode:
        V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE
        V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME

    cdef enum v4l2_mpeg_video_multi_slice_mode:
        V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE
        V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_MB
        V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_BYTES

    cdef enum v4l2_mpeg_video_h264_entropy_mode:
        V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC
        V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC

    cdef enum v4l2_mpeg_video_h264_level:
        V4L2_MPEG_VIDEO_H264_LEVEL_1_0
        V4L2_MPEG_VIDEO_H264_LEVEL_1B
        V4L2_MPEG_VIDEO_H264_LEVEL_1_1
        V4L2_MPEG_VIDEO_H264_LEVEL_1_2
        V4L2_MPEG_VIDEO_H264_LEVEL_1_3
        V4L2_MPEG_VIDEO_H264_LEVEL_2_0
        V4L2_MPEG_VIDEO_H264_LEVEL_2_1
        V4L2_MPEG_VIDEO_H264_LEVEL_2_2
        V4L2_MPEG_VIDEO_H264_LEVEL_3_0
        V4L2_MPEG_VIDEO_H264_LEVEL_3_1
        V4L2_MPEG_VIDEO_H264_LEVEL_3_2
        V4L2_MPEG_VIDEO_H264_LEVEL_4_0
        V4L2_MPEG_VIDEO_H264_LEVEL_4_1
        V4L2_MPEG_VIDEO_H264_LEVEL_4_2
        V4L2_MPEG_VIDEO_H264_LEVEL_5_0
        V4L2_MPEG_VIDEO_H264_LEVEL_5_1

    cdef enum v4l2_mpeg_video_h264_loop_filter_mode:
        V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED
        V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED
        V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY

    cdef enum v4l2_mpeg_video_h264_profile:
        V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE
        V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
        V4L2_MPEG_VIDEO_H264_PROFILE_MAIN
        V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA
        V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA
        V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA
        V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE
        V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH
        V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA
        V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH
        V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH

    cdef enum v4l2_mpeg_video_h264_vui_sar_idc:
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_12x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_10x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_16x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_40x33
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_24x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_20x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_32x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_80x33
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_18x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_15x11
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_64x33
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_160x99
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_4x3
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_3x2
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1
        V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED

    cdef enum v4l2_mpeg_video_mpeg4_level:
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_0
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_1
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_2
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_3
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_4
        V4L2_MPEG_VIDEO_MPEG4_LEVEL_5

    cdef enum v4l2_mpeg_video_mpeg4_profile:
        V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE
        V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE
        V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE
        V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE
        V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY

    cdef enum v4l2_mpeg_cx2341x_video_spatial_filter_mode:
        V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL
        V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO

    cdef enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type:
        V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF
        V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR
        V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_VERT
        V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_HV_SEPARABLE
        V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE

    cdef enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type:
        V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF
        V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR

    cdef enum v4l2_mpeg_cx2341x_video_temporal_filter_mode:
        V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL
        V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO

    cdef enum v4l2_mpeg_cx2341x_video_median_filter_type:
        V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF
        V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR
        V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_VERT
        V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR_VERT
        V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG

    cdef enum v4l2_mpeg_mfc51_video_frame_skip_mode:
        V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED
        V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT
        V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT

    cdef enum v4l2_mpeg_mfc51_video_force_frame_type:
        V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED
        V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME
        V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED

    cdef enum v4l2_exposure_auto_type:
        V4L2_EXPOSURE_AUTO
        V4L2_EXPOSURE_MANUAL
        V4L2_EXPOSURE_SHUTTER_PRIORITY
        V4L2_EXPOSURE_APERTURE_PRIORITY


    enum: V4L2_CTRL_FLAG_DISABLED
    enum: V4L2_CTRL_FLAG_GRABBED
    enum: V4L2_CTRL_FLAG_READ_ONLY
    enum: V4L2_CTRL_FLAG_UPDATE
    enum: V4L2_CTRL_FLAG_INACTIVE
    enum: V4L2_CTRL_FLAG_SLIDER
    enum: V4L2_CTRL_FLAG_WRITE_ONLY
    enum: V4L2_CTRL_FLAG_VOLATILE
    enum: V4L2_CTRL_FLAG_NEXT_CTRL


    enum: V4L2_CID_MAX_CTRLS
    enum: V4L2_CID_BASE
    enum: V4L2_CID_USER_BASE
    enum: V4L2_CID_PRIVATE_BASE
    enum: V4L2_CID_USER_CLASS
    enum: V4L2_CID_BRIGHTNESS
    enum: V4L2_CID_CONTRAST
    enum: V4L2_CID_SATURATION
    enum: V4L2_CID_HUE
    enum: V4L2_CID_AUDIO_VOLUME
    enum: V4L2_CID_AUDIO_BALANCE
    enum: V4L2_CID_AUDIO_BASS
    enum: V4L2_CID_AUDIO_TREBLE
    enum: V4L2_CID_AUDIO_MUTE
    enum: V4L2_CID_AUDIO_LOUDNESS
    enum: V4L2_CID_BLACK_LEVEL
    enum: V4L2_CID_AUTO_WHITE_BALANCE
    enum: V4L2_CID_DO_WHITE_BALANCE
    enum: V4L2_CID_RED_BALANCE
    enum: V4L2_CID_BLUE_BALANCE
    enum: V4L2_CID_GAMMA
    enum: V4L2_CID_WHITENESS
    enum: V4L2_CID_EXPOSURE
    enum: V4L2_CID_AUTOGAIN
    enum: V4L2_CID_GAIN
    enum: V4L2_CID_HFLIP
    enum: V4L2_CID_VFLIP
    enum: V4L2_CID_HCENTER
    enum: V4L2_CID_VCENTER
    enum: V4L2_CID_POWER_LINE_FREQUENCY
    enum: V4L2_CID_HUE_AUTO
    enum: V4L2_CID_WHITE_BALANCE_TEMPERATURE
    enum: V4L2_CID_SHARPNESS
    enum: V4L2_CID_BACKLIGHT_COMPENSATION
    enum: V4L2_CID_CHROMA_AGC
    enum: V4L2_CID_COLOR_KILLER
    enum: V4L2_CID_COLORFX
    enum: V4L2_CID_AUTOBRIGHTNESS
    enum: V4L2_CID_BAND_STOP_FILTER
    enum: V4L2_CID_ROTATE
    enum: V4L2_CID_BG_COLOR
    enum: V4L2_CID_CHROMA_GAIN
    enum: V4L2_CID_ILLUMINATORS_1
    enum: V4L2_CID_ILLUMINATORS_2
    enum: V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
    enum: V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
    enum: V4L2_CID_LASTP1
    enum: V4L2_CID_MPEG_BASE
    enum: V4L2_CID_MPEG_CLASS
    enum: V4L2_CID_MPEG_STREAM_TYPE
    enum: V4L2_CID_MPEG_STREAM_PID_PMT
    enum: V4L2_CID_MPEG_STREAM_PID_AUDIO
    enum: V4L2_CID_MPEG_STREAM_PID_VIDEO
    enum: V4L2_CID_MPEG_STREAM_PID_PCR
    enum: V4L2_CID_MPEG_STREAM_PES_ID_AUDIO
    enum: V4L2_CID_MPEG_STREAM_PES_ID_VIDEO
    enum: V4L2_CID_MPEG_STREAM_VBI_FMT
    enum: V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ
    enum: V4L2_CID_MPEG_AUDIO_ENCODING
    enum: V4L2_CID_MPEG_AUDIO_L1_BITRATE
    enum: V4L2_CID_MPEG_AUDIO_L2_BITRATE
    enum: V4L2_CID_MPEG_AUDIO_L3_BITRATE
    enum: V4L2_CID_MPEG_AUDIO_MODE
    enum: V4L2_CID_MPEG_AUDIO_MODE_EXTENSION
    enum: V4L2_CID_MPEG_AUDIO_EMPHASIS
    enum: V4L2_CID_MPEG_AUDIO_CRC
    enum: V4L2_CID_MPEG_AUDIO_MUTE
    enum: V4L2_CID_MPEG_AUDIO_AAC_BITRATE
    enum: V4L2_CID_MPEG_AUDIO_AC3_BITRATE
    enum: V4L2_CID_MPEG_VIDEO_ENCODING
    enum: V4L2_CID_MPEG_VIDEO_ASPECT
    enum: V4L2_CID_MPEG_VIDEO_B_FRAMES
    enum: V4L2_CID_MPEG_VIDEO_GOP_SIZE
    enum: V4L2_CID_MPEG_VIDEO_GOP_CLOSURE
    enum: V4L2_CID_MPEG_VIDEO_PULLDOWN
    enum: V4L2_CID_MPEG_VIDEO_BITRATE_MODE
    enum: V4L2_CID_MPEG_VIDEO_BITRATE
    enum: V4L2_CID_MPEG_VIDEO_BITRATE_PEAK
    enum: V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION
    enum: V4L2_CID_MPEG_VIDEO_MUTE
    enum: V4L2_CID_MPEG_VIDEO_MUTE_YUV
    enum: V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE
    enum: V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER
    enum: V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB
    enum: V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE
    enum: V4L2_CID_MPEG_VIDEO_HEADER_MODE
    enum: V4L2_CID_MPEG_VIDEO_MAX_REF_PIC
    enum: V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE
    enum: V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES
    enum: V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
    enum: V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
    enum: V4L2_CID_MPEG_VIDEO_VBV_SIZE
    enum: V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H263_MIN_QP
    enum: V4L2_CID_MPEG_VIDEO_H263_MAX_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_MIN_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_MAX_QP
    enum: V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM
    enum: V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE
    enum: V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE
    enum: V4L2_CID_MPEG_VIDEO_H264_I_PERIOD
    enum: V4L2_CID_MPEG_VIDEO_H264_LEVEL
    enum: V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA
    enum: V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA
    enum: V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE
    enum: V4L2_CID_MPEG_VIDEO_H264_PROFILE
    enum: V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT
    enum: V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH
    enum: V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE
    enum: V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE
    enum: V4L2_CID_MPEG_VIDEO_MPEG4_QPEL
    enum: V4L2_CID_MPEG_CX2341X_BASE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM
    enum: V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP
    enum: V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS
    enum: V4L2_CID_MPEG_MFC51_BASE
    enum: V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY
    enum: V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE
    enum: V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE
    enum: V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE
    enum: V4L2_CID_MPEG_MFC51_VIDEO_PADDING
    enum: V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV
    enum: V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT
    enum: V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF
    enum: V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY
    enum: V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK
    enum: V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH
    enum: V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC
    enum: V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P
    enum: V4L2_CID_CAMERA_CLASS_BASE
    enum: V4L2_CID_CAMERA_CLASS
    enum: V4L2_CID_EXPOSURE_AUTO
    enum: V4L2_CID_EXPOSURE_ABSOLUTE
    enum: V4L2_CID_EXPOSURE_AUTO_PRIORITY
    enum: V4L2_CID_PAN_RELATIVE
    enum: V4L2_CID_TILT_RELATIVE
    enum: V4L2_CID_PAN_RESET
    enum: V4L2_CID_TILT_RESET
    enum: V4L2_CID_PAN_ABSOLUTE
    enum: V4L2_CID_TILT_ABSOLUTE
    enum: V4L2_CID_FOCUS_ABSOLUTE
    enum: V4L2_CID_FOCUS_RELATIVE
    enum: V4L2_CID_FOCUS_AUTO
    enum: V4L2_CID_ZOOM_ABSOLUTE
    enum: V4L2_CID_ZOOM_RELATIVE
    enum: V4L2_CID_ZOOM_CONTINUOUS
    enum: V4L2_CID_PRIVACY
    enum: V4L2_CID_IRIS_ABSOLUTE
    enum: V4L2_CID_IRIS_RELATIVE
    enum: V4L2_CID_FM_TX_CLASS_BASE
    enum: V4L2_CID_FM_TX_CLASS
    enum: V4L2_CID_RDS_TX_DEVIATION
    enum: V4L2_CID_RDS_TX_PI
    enum: V4L2_CID_RDS_TX_PTY
    enum: V4L2_CID_RDS_TX_PS_NAME
    enum: V4L2_CID_RDS_TX_RADIO_TEXT
    enum: V4L2_CID_AUDIO_LIMITER_ENABLED
    enum: V4L2_CID_AUDIO_LIMITER_RELEASE_TIME
    enum: V4L2_CID_AUDIO_LIMITER_DEVIATION
    enum: V4L2_CID_AUDIO_COMPRESSION_ENABLED
    enum: V4L2_CID_AUDIO_COMPRESSION_GAIN
    enum: V4L2_CID_AUDIO_COMPRESSION_THRESHOLD
    enum: V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME
    enum: V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME
    enum: V4L2_CID_PILOT_TONE_ENABLED
    enum: V4L2_CID_PILOT_TONE_DEVIATION
    enum: V4L2_CID_PILOT_TONE_FREQUENCY
    enum: V4L2_CID_TUNE_PREEMPHASIS
    enum: V4L2_CID_TUNE_POWER_LEVEL
    enum: V4L2_CID_TUNE_ANTENNA_CAPACITOR
    enum: V4L2_CID_FLASH_CLASS_BASE
    enum: V4L2_CID_FLASH_CLASS
    enum: V4L2_CID_FLASH_LED_MODE
    enum: V4L2_CID_FLASH_STROBE_SOURCE
    enum: V4L2_CID_FLASH_STROBE
    enum: V4L2_CID_FLASH_STROBE_STOP
    enum: V4L2_CID_FLASH_STROBE_STATUS
    enum: V4L2_CID_FLASH_TIMEOUT
    enum: V4L2_CID_FLASH_INTENSITY
    enum: V4L2_CID_FLASH_TORCH_INTENSITY
    enum: V4L2_CID_FLASH_INDICATOR_INTENSITY
    enum: V4L2_CID_FLASH_FAULT
    enum: V4L2_CID_FLASH_CHARGE
    enum: V4L2_CID_FLASH_READY



    cdef enum v4l2_preemphasis:
        V4L2_PREEMPHASIS_DISABLED
        V4L2_PREEMPHASIS_50_uS
        V4L2_PREEMPHASIS_75_uS

    cdef enum v4l2_flash_led_mode:
        V4L2_FLASH_LED_MODE_NONE
        V4L2_FLASH_LED_MODE_FLASH
        V4L2_FLASH_LED_MODE_TORCH

    cdef enum v4l2_flash_strobe_source:
        V4L2_FLASH_STROBE_SOURCE_SOFTWARE
        V4L2_FLASH_STROBE_SOURCE_EXTERNAL

    cdef struct v4l2_tuner:
        __u32 index
        __u8 name[32]
        v4l2_tuner_type type
        __u32 capability
        __u32 rangelow
        __u32 rangehigh
        __u32 rxsubchans
        __u32 audmode
        __s32 signal
        __s32 afc
        __u32 reserved[4]

    cdef struct v4l2_modulator:
        __u32 index
        __u8 name[32]
        __u32 capability
        __u32 rangelow
        __u32 rangehigh
        __u32 txsubchans
        __u32 reserved[4]

    cdef struct v4l2_frequency:
        __u32 tuner
        v4l2_tuner_type type
        __u32 frequency
        __u32 reserved[8]

    cdef struct v4l2_hw_freq_seek:
        __u32 tuner
        v4l2_tuner_type type
        __u32 seek_upward
        __u32 wrap_around
        __u32 spacing
        __u32 reserved[7]

    cdef struct v4l2_rds_data:
        __u8 lsb
        __u8 msb
        __u8 block

    cdef struct v4l2_audio:
        __u32 index
        __u8 name[32]
        __u32 capability
        __u32 mode
        __u32 reserved[2]

    cdef struct v4l2_audioout:
        __u32 index
        __u8 name[32]
        __u32 capability
        __u32 mode
        __u32 reserved[2]

    cdef struct v4l2_enc_idx_entry:
        __u64 offset
        __u64 pts
        __u32 length
        __u32 flags
        __u32 reserved[2]

    cdef struct v4l2_enc_idx:
        __u32 entries
        __u32 entries_cap
        __u32 reserved[4]
        v4l2_enc_idx_entry entry[64]

    # cdef struct ____v4l2_encoder_cmd_N16v4l2_encoder_cmd4DOT_11E_N16v4l2_encoder_cmd4DOT_114DOT_12E:
    #     __u32 data[8]

    # cdef union __v4l2_encoder_cmd_N16v4l2_encoder_cmd4DOT_11E:
    #     ____v4l2_encoder_cmd_N16v4l2_encoder_cmd4DOT_11E_N16v4l2_encoder_cmd4DOT_114DOT_12E_t raw



    # cdef struct v4l2_encoder_cmd:
    #     __u32 cmd
    #     __u32 flags
    #     __v4l2_encoder_cmd_N16v4l2_encoder_cmd4DOT_11E_t

    cdef struct v4l2_vbi_format:
        __u32 sampling_rate
        __u32 offset
        __u32 samples_per_line
        __u32 sample_format
        __s32 start[2]
        __u32 count[2]
        __u32 flags
        __u32 reserved[2]

    cdef struct v4l2_sliced_vbi_format:
        __u16 service_set
        __u16 service_lines[2][24]
        __u32 io_size
        __u32 reserved[2]

    cdef struct v4l2_sliced_vbi_cap:
        __u16 service_set
        __u16 service_lines[2][24]
        v4l2_buf_type type
        __u32 reserved[3]

    cdef struct v4l2_sliced_vbi_data:
        __u32 id
        __u32 field
        __u32 line
        __u32 reserved
        __u8 data[48]

    cdef struct v4l2_mpeg_vbi_itv0_line:
        __u8 id
        __u8 data[42]


    ###__le32 is very specifc, ill leve everything out around this:
    # cdef struct v4l2_mpeg_vbi_itv0:
    #     __le32 linemask[2]
    #     v4l2_mpeg_vbi_itv0_line line[35]

    # cdef struct v4l2_mpeg_vbi_ITV0:
    #     v4l2_mpeg_vbi_itv0_line line[36]

    # # cdef union __v4l2_mpeg_vbi_fmt_ivtv_N22v4l2_mpeg_vbi_fmt_ivtv4DOT_13E:
    #     # v4l2_mpeg_vbi_itv0 itv0
    #     # v4l2_mpeg_vbi_ITV0 ITV0

    # cdef struct v4l2_mpeg_vbi_fmt_ivtv:
    #     __u8 magic[4]
    #     # __v4l2_mpeg_vbi_fmt_ivtv_N22v4l2_mpeg_vbi_fmt_ivtv4DOT_13E_t
    #     v4l2_mpeg_vbi_itv0 itv0
    #     v4l2_mpeg_vbi_ITV0 ITV0

    cdef struct v4l2_plane_pix_format:
        __u32 sizeimage
        __u16 bytesperline
        __u16 reserved[7]

    cdef struct v4l2_pix_format_mplane:
        __u32 width
        __u32 height
        __u32 pixelformat
        v4l2_field field
        v4l2_colorspace colorspace
        v4l2_plane_pix_format plane_fmt[8]
        __u8 num_planes
        __u8 reserved[11]

    cdef union __v4l2_format_N11v4l2_format4DOT_14E_t:
        v4l2_pix_format pix
        v4l2_pix_format_mplane pix_mp
        v4l2_window win
        v4l2_vbi_format vbi
        v4l2_sliced_vbi_format sliced
        __u8 raw_data[200]

    cdef struct v4l2_format:
        v4l2_buf_type type
        __v4l2_format_N11v4l2_format4DOT_14E_t fmt

    cdef union __v4l2_streamparm_N15v4l2_streamparm4DOT_15E_t:
        v4l2_captureparm capture
        v4l2_outputparm output
        __u8 raw_data[200]

    cdef struct v4l2_streamparm:
        v4l2_buf_type type
        __v4l2_streamparm_N15v4l2_streamparm4DOT_15E_t parm

    cdef struct v4l2_event_vsync:
        __u8 field

    # cdef union __v4l2_event_ctrl_N15v4l2_event_ctrl4DOT_16E:
    #     __s32 value
    #     __s64 value64

    cdef struct v4l2_event_ctrl:
        __u32 changes
        __u32 type
        # __v4l2_event_ctrl_N15v4l2_event_ctrl4DOT_16E_t
        __s32 value
        __s64 value64
        __u32 flags
        __s32 minimum
        __s32 maximum
        __s32 step
        __s32 default_value

    cdef struct v4l2_event_frame_sync:
        __u32 frame_sequence

    cdef union __v4l2_event_N10v4l2_event4DOT_17E_t:
        v4l2_event_vsync vsync
        v4l2_event_ctrl ctrl
        v4l2_event_frame_sync frame_sync
        __u8 data[64]

    cdef struct v4l2_event:
        __u32 type
        __v4l2_event_N10v4l2_event4DOT_17E_t u
        __u32 pending
        __u32 sequence
        timespec timestamp
        __u32 id
        __u32 reserved[8]

    cdef struct v4l2_event_subscription:
        __u32 type
        __u32 id
        __u32 flags
        __u32 reserved[5]

    cdef union __v4l2_dbg_match_N14v4l2_dbg_match4DOT_18E:
        __u32 addr
        char name[32]

    cdef struct v4l2_dbg_match:
        __u32 type
        # __v4l2_dbg_match_N14v4l2_dbg_match4DOT_18E_t
        __u32 addr
        char name[32]

    cdef struct v4l2_dbg_register:
        v4l2_dbg_match match
        __u32 size
        __u64 reg
        __u64 val

    cdef struct v4l2_dbg_chip_ident:
        v4l2_dbg_match match
        __u32 ident
        __u32 revision

    cdef struct v4l2_create_buffers:
        __u32 index
        __u32 count
        v4l2_memory memory
        v4l2_format format
        __u32 reserved[8]


