# =============================================================================
#                           CMake OpenGL Boilerplate
#
#            Starting project for cross platform OpenGL development
#              Copyright © 2016 Zoltan Dalmadi (dmz985@gmail.com)
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
    "${PROJECT_SOURCE_DIR}/extern/SOIL2/include"
    "${PROJECT_SOURCE_DIR}/deps/SOIL2/include"
    "${PROJECT_SOURCE_DIR}/libs/SOIL2/include"
    "${OPENGL_INCLUDE_DIR}"
    /usr/include
    /usr/local/include
    /usr/share/include
  DOC
    "The directory where SOIL2/SOIL2.h resides"
)

find_library(SOIL2_LIBRARIES
  SOIL2
  NAMES
    SOIL2
  PATHS
    "${SOIL2_LOCATION}/lib"
    "${SOIL2_LOCATION}/lib/x64"
    "${SOIL2_LOCATION}/lib/x11"
    "$ENV{SOIL2_LOCATION}/lib"
    "$ENV{SOIL2_LOCATION}/lib/x64"
    "$ENV{SOIL2_LOCATION}/lib/x11"
    "${PROJECT_SOURCE_DIR}/extern/SOIL2/lib"
    "${PROJECT_SOURCE_DIR}/deps/SOIL2/lib"
    "${PROJECT_SOURCE_DIR}/libs/SOIL2/lib"
    "${OPENGL_LIBRARY_DIR}"
    /usr/lib
    /usr/lib64
    /usr/local/lib
    /usr/local/lib64
    /usr/share/lib
    /usr/share/lib64
  DOC
    "The SOIL2 library"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(SOIL2
  "Could NOT find SOIL2, it will be downloaded on first build."
  SOIL2_LIBRARIES SOIL2_INCLUDE_DIR
)
