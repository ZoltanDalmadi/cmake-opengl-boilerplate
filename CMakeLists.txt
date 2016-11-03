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

cmake_minimum_required(VERSION 3.0)
project(testProj)

# Needed for downloading and building external libraries
include(ExternalProject)
find_package(Git REQUIRED)

# Enable folders in Visual Studio
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Obviously we need OpenGL
find_package(OpenGL REQUIRED)

# Set compiler flags when using gcc
if (NOT MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")
endif()

# set path of find modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")

# gl3w
find_package(GL3W)

if (GL3W_FOUND)
  include_directories(${GL3W_INCLUDE_DIR})
else()
  include(${CMAKE_SOURCE_DIR}/cmake/gl3w.cmake)
endif()

# glfw
find_package(GLFW)

if (GLFW_FOUND)
  include_directories(${GLFW_INCLUDE_DIR})
else()
  include(${CMAKE_SOURCE_DIR}/cmake/glfw.cmake)
endif()

# glm
find_package(GLM)

if (GLM_FOUND)
  include_directories(${GLM_INCLUDE_DIR})
else()
  include(${CMAKE_SOURCE_DIR}/cmake/glm.cmake)
endif()

# SOIL2
find_package(SOIL2)

if (SOIL2_FOUND)
  include_directories(${SOIL2_INCLUDE_DIR})
else()
  include(${CMAKE_SOURCE_DIR}/cmake/SOIL2.cmake)
endif()

# add src subdirectory
add_subdirectory(src)
