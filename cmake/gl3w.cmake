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

# gl3w needs Python to generate source files
include(FindPythonInterp)

if (MSVC)
  set(GL3W_LIB_FILE "gl3w.lib")
else()
  set(GL3W_LIB_FILE "libgl3w.a")
endif()

ExternalProject_Add(
  gl3w_dl
  URL "https://github.com/skaslev/gl3w/archive/master.zip"
  URL_HASH SHA1=28078d8f6a9e3575aaa1efe40c278ea6d6977538
  DOWNLOAD_NO_PROGRESS 1
  PREFIX ${CMAKE_BINARY_DIR}/gl3w
  PATCH_COMMAND ${PYTHON_EXECUTABLE} <SOURCE_DIR>/gl3w_gen.py
  CMAKE_ARGS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
  # disable install
  INSTALL_COMMAND ""
)

# set up a library target for gl3w
add_library(gl3w IMPORTED STATIC GLOBAL)
add_dependencies(gl3w gl3w_dl)

ExternalProject_Get_Property(gl3w_dl SOURCE_DIR BINARY_DIR)

# set up library file locations
if(MSVC)
  set_target_properties(gl3w PROPERTIES
    IMPORTED_LOCATION_DEBUG "${BINARY_DIR}/Debug/${GL3W_LIB_FILE}"
    IMPORTED_LOCATION_RELEASE "${BINARY_DIR}/Release/${GL3W_LIB_FILE}")
else()
  set_target_properties(gl3w PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/${GL3W_LIB_FILE}")
endif()

# append gl3w include dir to include search path
include_directories(${SOURCE_DIR}/include)
get_target_property(GL3W_LIBRARIES gl3w IMPORTED_LOCATION)
