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
# Try to find GLM include path.
# Once done this will define
#
# GLM_FOUND
# GLM_INCLUDE_DIR

find_path(GLM_INCLUDE_DIR
  NAMES
    glm/glm.hpp
  PATHS
    "${GLM_LOCATION}/include"
    "$ENV{GLM_LOCATION}/include"
    "$ENV{PROGRAMFILES}/glm"
    "${OPENGL_INCLUDE_DIR}"
    /usr/openwin/share/include
    /usr/openwin/include
    /usr/X11R6/include
    /usr/include/X11
    /opt/graphics/OpenGL/include
    /usr/local/include
    /usr/include
  DOC
    "The directory where glm/glm.hpp resides"
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GLM
  "Could NOT find GLM, it will be downloaded on first build."
  GLM_INCLUDE_DIR
)
