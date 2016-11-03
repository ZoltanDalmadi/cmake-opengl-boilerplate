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
  set(SOIL2_LIB_FILE "SOIL2.lib")
else()
  set(SOIL2_LIB_FILE "libSOIL2.a")
endif()

# this file will be the CMakeLists.txt file of SOIL2
file(WRITE ${CMAKE_BINARY_DIR}/SOIL2_build.cmake
"cmake_minimum_required(VERSION 3.0)
project(SOIL2)

file(GLOB SOIL2_SOURCES *.c)

add_library(SOIL2 STATIC
  \${SOIL2_SOURCES}
)

if (MSVC)
  target_compile_options(SOIL2 PUBLIC \"/TP\")
  target_compile_definitions(SOIL2 PUBLIC \"_CRT_SECURE_NO_WARNINGS\")
else()
  target_compile_options(SOIL2 PUBLIC \"-O2\" \"-DNDEBUG\")
endif()
")

ExternalProject_Add(
  SOIL2_dl
  URL "https://bitbucket.org/SpartanJ/soil2/get/default.zip"
  DOWNLOAD_NO_PROGRESS 1
  PREFIX ${CMAKE_BINARY_DIR}/SOIL2
  PATCH_COMMAND ${CMAKE_COMMAND} -E rename ${CMAKE_BINARY_DIR}/SOIL2_build.cmake <SOURCE_DIR>/src/SOIL2/CMakeLists.txt
  CMAKE_ARGS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" <SOURCE_DIR>/src/SOIL2
  INSTALL_COMMAND ""
)

# set up a library target for SOIL2
add_library(SOIL2 IMPORTED STATIC GLOBAL)
add_dependencies(SOIL2 SOIL2_dl)

ExternalProject_Get_Property(SOIL2_dl SOURCE_DIR BINARY_DIR)

# setup library file locations
if(MSVC)
  set_target_properties(SOIL2 PROPERTIES
    IMPORTED_LOCATION_DEBUG "${BINARY_DIR}/Debug/${SOIL2_LIB_FILE}"
    IMPORTED_LOCATION_RELEASE "${BINARY_DIR}/Release/${SOIL2_LIB_FILE}")
else()
  set_target_properties(SOIL2 PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/${SOIL2_LIB_FILE}")
endif()

# append SOIL2 include dir to include search path
include_directories(${SOURCE_DIR}/src/SOIL2)
get_target_property(SOIL2_LIBRARIES SOIL2 IMPORTED_LOCATION)
