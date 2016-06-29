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

if (MSVC)
  set(GLFW_LIB_FILE "glfw3.lib")
else()
  set(GLFW_LIB_FILE "libglfw3.a")
endif()

ExternalProject_Add(
  glfw_dl
  URL "https://github.com/glfw/glfw/releases/download/3.2/glfw-3.2.zip"
  URL_HASH SHA1=5ccc588d5277ea911dc6dc33e3a696f645eabd8e
  DOWNLOAD_NO_PROGRESS 1
  PREFIX ${CMAKE_BINARY_DIR}/glfw
  # we just need the library file, no tests and examples please
  CMAKE_ARGS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" "-DGLFW_BUILD_DOCS=OFF"
  "-DGLFW_BUILD_EXAMPLES=OFF" "-DGLFW_BUILD_TESTS:BOOL=OFF"
  "-DGLFW_INSTALL=OFF" "-DGLFW_USE_DWM_SWAP_INTERVAL=ON"
  # disable install
  INSTALL_COMMAND ""
)

# set up a library target for glfw
add_library(glfw IMPORTED STATIC GLOBAL)
add_dependencies(glfw glfw_dl)

ExternalProject_Get_Property(glfw_dl SOURCE_DIR BINARY_DIR)

# setup library file locations
if(MSVC)
  set_target_properties(glfw PROPERTIES
    IMPORTED_LOCATION_DEBUG "${BINARY_DIR}/src/Debug/${GLFW_LIB_FILE}"
    IMPORTED_LOCATION_RELEASE "${BINARY_DIR}/src/Release/${GLFW_LIB_FILE}")
else()
  set_target_properties(glfw PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/src/${GLFW_LIB_FILE}")
endif()

# append glfw include dir to include search path
include_directories(${SOURCE_DIR}/include)

get_target_property(GLFW_LIBRARIES glfw IMPORTED_LOCATION)
