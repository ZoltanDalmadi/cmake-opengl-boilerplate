# =============================================================================
#                           CMake OpenGL Boilerplate
#
#            Starting project for cross platform OpenGL development
#              Copyright © 2015 Zoltan Dalmadi (dmz985@gmail.com)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# =============================================================================
#
# Try to find GL3W include path and library.
# Once done this will define
#
# GL3W_FOUND
# GL3W_INCLUDE_DIR
# GL3W_LIBRARIES

find_path(GL3W_INCLUDE_DIR
  NAMES
    GL/gl3w.h
    GL/glcorearb.h
  PATHS
    "${GL3W_LOCATION}/include"
    "$ENV{GL3W_LOCATION}/include"
    "$ENV{PROGRAMFILES}/gl3w/include"
    "${OPENGL_INCLUDE_DIR}"
    /usr/openwin/share/include
    /usr/openwin/include
    /usr/X11R6/include
    /usr/include/X11
    /usr/local/include
    /usr/include
  DOC
    "The directory where GL/gl3w.h resides"
)

find_library(GL3W_LIBRARIES
    gl3w
  PATHS
    "${GL3W_LOCATION}/lib"
    "${GL3W_LOCATION}/lib/x64"
    "${GL3W_LOCATION}/lib/x11"
    "$ENV{GL3W_LOCATION}/lib"
    "$ENV{GL3W_LOCATION}/lib/x64"
    "$ENV{GL3W_LOCATION}/lib/x11"
    "${PROJECT_SOURCE_DIR}/extern/gl3w/bin"
    "${PROJECT_SOURCE_DIR}/extern/gl3w/lib"
    "$ENV{PROGRAMFILES}/GL3W/lib"
    "${OPENGL_LIBRARY_DIR}"
    /usr/lib
    /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    /usr/lib64
    /usr/local/lib
    /usr/local/lib/${CMAKE_LIBRARY_ARCHITECTURE}
    /usr/local/lib64
    /usr/X11R6/lib
    /usr/openwin/lib
  DOC
    "The GL3W library"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GL3W DEFAULT_MSG
  GL3W_LIBRARIES GL3W_INCLUDE_DIR
)
