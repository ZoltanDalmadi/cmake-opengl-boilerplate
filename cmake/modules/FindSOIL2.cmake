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
# Try to find SOIL2 include path and library.
# Once done this will define
#
# SOIL2_FOUND
# SOIL2_INCLUDE_DIR
# SOIL2_LIBRARIES

find_path(SOIL2_INCLUDE_DIR
  NAMES
    SOIL2/etc1_utils.h
    SOIL2/image_DXT.h
    SOIL2/image_helper.h
    SOIL2/SOIL2.h
  PATHS
    "${SOIL2_LOCATION}/include"
    "$ENV{SOIL2_LOCATION}/include"
    "$ENV{PROGRAMFILES}/SOIL2/include"
    "${OPENGL_INCLUDE_DIR}"
    /usr/openwin/share/include
    /usr/openwin/include
    /usr/X11R6/include
    /usr/include/X11
    /usr/local/include
    /usr/include
  DOC
  "The directory where SOIL2/SOIL2.h resides"
)

find_library(SOIL2_LIBRARIES
    SOIL2
  PATHS
    "${SOIL2_LOCATION}/lib"
    "${SOIL2_LOCATION}/lib/x64"
    "${SOIL2_LOCATION}/lib/x11"
    "$ENV{SOIL2_LOCATION}/lib"
    "$ENV{SOIL2_LOCATION}/lib/x64"
    "$ENV{SOIL2_LOCATION}/lib/x11"
    "${PROJECT_SOURCE_DIR}/extern/SOIL2/bin"
    "${PROJECT_SOURCE_DIR}/extern/SOIL2/lib"
    "$ENV{PROGRAMFILES}/SOIL2/lib"
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
  "The SOIL2 library"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(SOIL2 DEFAULT_MSG
    SOIL2_LIBRARIES SOIL2_INCLUDE_DIR
)
