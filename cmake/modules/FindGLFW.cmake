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
# Try to find GLFW library and include path.
# Once done this will define
#
# GLFW_FOUND
# GLFW_INCLUDE_DIR
# GLFW_LIBRARIES

find_path(GLFW_INCLUDE_DIR
  NAMES
    GLFW/glfw3.h
  PATHS
    "${GLFW_LOCATION}/include"
    "$ENV{GLFW_LOCATION}/include"
    "${PROJECT_SOURCE_DIR}/extern/glfw/include"
    "${PROJECT_SOURCE_DIR}/deps/glfw/include"
    "${PROJECT_SOURCE_DIR}/libs/glfw/include"
    "${OPENGL_INCLUDE_DIR}"
    /usr/include
    /usr/local/include
    /usr/share/include
  DOC
    "The directory where GL/glfw.h resides"
)

find_library(GLFW_LIBRARIES
  glfw
  NAMES
    glfw32
    glfw32s
    glfw
    glfw3
  PATHS
    "${GLFW_LOCATION}/lib"
    "${GLFW_LOCATION}/lib/x64"
    "${GL3W_LOCATION}/lib/x11"
    "$ENV{GLFW_LOCATION}/lib"
    "$ENV{GLFW_LOCATION}/lib/x64"
    "$ENV{GL3W_LOCATION}/lib/x11"
    "${PROJECT_SOURCE_DIR}/extern/glfw/lib"
    "${PROJECT_SOURCE_DIR}/deps/glfw/lib"
    "${PROJECT_SOURCE_DIR}/libs/glfw/lib"
    "${OPENGL_LIBRARY_DIR}"
    /usr/lib
    /usr/lib64
    /usr/local/lib
    /usr/local/lib64
    /usr/share/lib
    /usr/share/lib64
  DOC
    "The GLFW library"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GLFW
  "Could NOT find GLFW, it will be downloaded on first build."
  GLFW_LIBRARIES GLFW_INCLUDE_DIR
)
