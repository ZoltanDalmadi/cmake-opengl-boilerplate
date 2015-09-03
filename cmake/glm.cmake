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

ExternalProject_Add(
  glm_dl
  URL "https://github.com/g-truc/glm/releases/download/0.9.7.0/glm-0.9.7.0.7z"
  URL_HASH SHA1=dfd71e8a8bb5ea405086ccd89bf2515e068eb798
  DOWNLOAD_NO_PROGRESS 1
  PREFIX ${CMAKE_BINARY_DIR}/glm
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

ExternalProject_Get_Property(glm_dl SOURCE_DIR)

# append glm include dir to include search path
include_directories(${SOURCE_DIR})
