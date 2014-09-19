cdef extern from '/opt/libjpeg-turbo/include/turbojpeg.h':
    cdef enum TJSAMP:
        TJSAMP_444
        TJSAMP_422
        TJSAMP_420
        TJSAMP_GRAY
        TJSAMP_440

    int tjMCUWidth[5]
    int tjMCUHeight[5]

    cdef enum TJPF:
        TJPF_RGB
        TJPF_BGR
        TJPF_RGBX
        TJPF_BGRX
        TJPF_XBGR
        TJPF_XRGB
        TJPF_GRAY
        TJPF_RGBA
        TJPF_BGRA
        TJPF_ABGR
        TJPF_ARGB

    int tjRedOffset[11]
    int tjGreenOffset[11]
    int tjBlueOffset[11]
    int tjPixelSize[11]

    cdef enum TJXOP:
        TJXOP_NONE
        TJXOP_HFLIP
        TJXOP_VFLIP
        TJXOP_TRANSPOSE
        TJXOP_TRANSVERSE
        TJXOP_ROT90
        TJXOP_ROT180
        TJXOP_ROT270

    cdef struct tjscalingfactor:
        int num
        int denom

    cdef struct tjregion:
        int x
        int y
        int w
        int h

    cdef struct tjtransform:
        tjregion r
        int op
        int options
        void *data
        int (*customFilter)(short int *, tjregion, tjregion, int, int, tjtransform *)

    ctypedef tjtransform tjtransform

    ctypedef void *tjhandle

    tjhandle tjInitCompress()

    int tjCompress2(tjhandle handle, unsigned char *srcBuf, int width, int pitch, int height, int pixelFormat, unsigned char **jpegBuf, long unsigned int *jpegSize, int jpegSubsamp, int jpegQual, int flags)

    long unsigned int tjBufSize(int width, int height, int jpegSubsamp)

    long unsigned int tjBufSizeYUV(int width, int height, int subsamp)

    int tjEncodeYUV2(tjhandle handle, unsigned char *srcBuf, int width, int pitch, int height, int pixelFormat, unsigned char *dstBuf, int subsamp, int flags)

    tjhandle tjInitDecompress()

    int tjDecompressHeader2(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, int *width, int *height, int *jpegSubsamp)

    tjscalingfactor *tjGetScalingFactors(int *numscalingfactors)


    # /**
    #  * Decompress a JPEG image to an RGB or grayscale image.
    #  *
    #  * @param handle a handle to a TurboJPEG decompressor or transformer instance
    #  * @param jpegBuf pointer to a buffer containing the JPEG image to decompress
    #  * @param jpegSize size of the JPEG image (in bytes)
    #  * @param dstBuf pointer to an image buffer that will receive the decompressed
    #  *        image.  This buffer should normally be <tt>pitch * scaledHeight</tt>
    #  *        bytes in size, where <tt>scaledHeight</tt> can be determined by
    #  *        calling #TJSCALED() with the JPEG image height and one of the scaling
    #  *        factors returned by #tjGetScalingFactors().  The dstBuf pointer may
    #  *        also be used to decompress into a specific region of a larger buffer.
    #  * @param width desired width (in pixels) of the destination image.  If this is
    #  *        smaller than the width of the JPEG image being decompressed, then
    #  *        TurboJPEG will use scaling in the JPEG decompressor to generate the
    #  *        largest possible image that will fit within the desired width.  If
    #  *        width is set to 0, then only the height will be considered when
    #  *        determining the scaled image size.
    #  * @param pitch bytes per line of the destination image.  Normally, this is
    #  *        <tt>scaledWidth * #tjPixelSize[pixelFormat]</tt> if the decompressed
    #  *        image is unpadded, else <tt>#TJPAD(scaledWidth *
    #  *        #tjPixelSize[pixelFormat])</tt> if each line of the decompressed
    #  *        image is padded to the nearest 32-bit boundary, as is the case for
    #  *        Windows bitmaps.  (NOTE: <tt>scaledWidth</tt> can be determined by
    #  *        calling #TJSCALED() with the JPEG image width and one of the scaling
    #  *        factors returned by #tjGetScalingFactors().)  You can also be clever
    #  *        and use the pitch parameter to skip lines, etc.  Setting this
    #  *        parameter to 0 is the equivalent of setting it to <tt>scaledWidth
    #  *        * #tjPixelSize[pixelFormat]</tt>.
    #  * @param height desired height (in pixels) of the destination image.  If this
    #  *        is smaller than the height of the JPEG image being decompressed, then
    #  *        TurboJPEG will use scaling in the JPEG decompressor to generate the
    #  *        largest possible image that will fit within the desired height.  If
    #  *        height is set to 0, then only the width will be considered when
    #  *        determining the scaled image size.
    #  * @param pixelFormat pixel format of the destination image (see @ref
    #  *        TJPF "Pixel formats".)
    #  * @param flags the bitwise OR of one or more of the @ref TJFLAG_BOTTOMUP
    #  *        "flags".
    #  *
    #  * @return 0 if successful, or -1 if an error occurred (see #tjGetErrorStr().)
    #  */
    int tjDecompress2(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, unsigned char *dstBuf, int width, int pitch, int height, int pixelFormat, int flags)

    # /**
    #  * Decompress a JPEG image to a YUV planar image.  This function performs JPEG
    #  * decompression but leaves out the color conversion step, so a planar YUV
    #  * image is generated instead of an RGB image.  The padding of the planes in
    #  * this image is the same as the images generated by #tjEncodeYUV2().  Note
    #  * that, if the width or height of the image is not an even multiple of the MCU
    #  * block size (see #tjMCUWidth and #tjMCUHeight), then an intermediate buffer
    #  * copy will be performed within TurboJPEG.
    #  *
    #  * @param handle a handle to a TurboJPEG decompressor or transformer instance
    #  * @param jpegBuf pointer to a buffer containing the JPEG image to decompress
    #  * @param jpegSize size of the JPEG image (in bytes)
    #  * @param dstBuf pointer to an image buffer that will receive the YUV image.
    #  *        Use #tjBufSizeYUV to determine the appropriate size for this buffer
    #  *        based on the image width, height, and level of subsampling.
    #  * @param flags the bitwise OR of one or more of the @ref TJFLAG_BOTTOMUP
    #  *        "flags".
    #  *
    #  * @return 0 if successful, or -1 if an error occurred (see #tjGetErrorStr().)
    #  */

    int tjDecompressToYUV(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, unsigned char *dstBuf, int flags)

    tjhandle tjInitTransform()

    int tjTransform(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, int n, unsigned char **dstBufs, long unsigned int *dstSizes, tjtransform *transforms, int flags)

    int tjDestroy(tjhandle handle)

    unsigned char *tjAlloc(int bytes)

    void tjFree(unsigned char *buffer)

    char *tjGetErrorStr()

    long unsigned int TJBUFSIZE(int width, int height)

    long unsigned int TJBUFSIZEYUV(int width, int height, int jpegSubsamp)

    int tjCompress(tjhandle handle, unsigned char *srcBuf, int width, int pitch, int height, int pixelSize, unsigned char *dstBuf, long unsigned int *compressedSize, int jpegSubsamp, int jpegQual, int flags)

    int tjEncodeYUV(tjhandle handle, unsigned char *srcBuf, int width, int pitch, int height, int pixelSize, unsigned char *dstBuf, int subsamp, int flags)

    int tjDecompressHeader(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, int *width, int *height)

    int tjDecompress(tjhandle handle, unsigned char *jpegBuf, long unsigned int jpegSize, unsigned char *dstBuf, int width, int pitch, int height, int pixelSize, int flags)


