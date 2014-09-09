import os, platform
import numpy

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize


extensions = [
    Extension(  name="v4l2",
                sources=['v4l2.pyx'],
                include_dirs =  [numpy.get_include()],
                libraries = ['v4l2','v4lconvert'],
                extra_link_args=[],
                extra_compile_args=[]
            ),
]

setup(  name="v4l2",
        version="0.0.1",
        description="V4L2 bindings with format conversion tool.",
        ext_modules=cythonize(extensions)
)