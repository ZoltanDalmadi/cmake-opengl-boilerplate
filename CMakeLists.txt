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

# Needed for downloading and building gl3w and glfw
include(ExternalProject)

# gl3w needs Python to generate source files
include(FindPythonInterp)

# Obviously we need OpenGL libraries as well
find_package(OpenGL REQUIRED)

# Set library names according to platform
if (MSVC)
    set(GL3W_LIB_FILE "gl3w.lib")
    set(GLFW_LIB_FILE "glfw3.lib")
else()
    set(GL3W_LIB_FILE "libgl3w.a")
    set(GLFW_LIB_FILE "libglfw3.a")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")
endif()

# gl3w ------------------------------------------------------------------------
ExternalProject_Add(
    gl3w
    URL "https://github.com/skaslev/gl3w/archive/master.zip"
    DOWNLOAD_NO_PROGRESS 1
    PREFIX ${CMAKE_BINARY_DIR}/gl3w
    CMAKE_ARGS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
    # disable install
    INSTALL_COMMAND ""
)

# generate source files with Python before building (runs gl3w_gen.py)
ExternalProject_Add_Step(gl3w generate
    COMMAND ${PYTHON_EXECUTABLE} <SOURCE_DIR>/gl3w_gen.py
    WORKING_DIRECTORY <SOURCE_DIR>
    # run after update step, but before build step
    DEPENDEES update
)

# set up a library target for gl3w
add_library(libgl3w IMPORTED STATIC GLOBAL)
add_dependencies(libgl3w gl3w)

# tell CMake where is the built library file
ExternalProject_Get_Property(gl3w SOURCE_DIR BINARY_DIR)
set_target_properties(libgl3w PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/${GL3W_LIB_FILE}"
)

# Tell configuration specific library file locations for MSVC
if(MSVC)
set_target_properties(libgl3w PROPERTIES
    IMPORTED_LOCATION_DEBUG "${BINARY_DIR}/Debug/${GL3W_LIB_FILE}"
    IMPORTED_LOCATION_RELEASE "${BINARY_DIR}/Release/${GL3W_LIB_FILE}"
)
endif()

# append gl3w include dir to include search path
include_directories(${SOURCE_DIR}/include)

# glfw ------------------------------------------------------------------------
ExternalProject_Add(
    glfw
    URL "https://github.com/glfw/glfw/releases/download/3.1.1/glfw-3.1.1.zip"
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
add_library(libglfw IMPORTED STATIC GLOBAL)
add_dependencies(libglfw glfw)

# tell CMake where is the built library file
ExternalProject_Get_Property(glfw SOURCE_DIR BINARY_DIR)
set_target_properties(libglfw PROPERTIES
    IMPORTED_LOCATION "${BINARY_DIR}/src/${GLFW_LIB_FILE}"
)

# tell configuration specific library file locations for MSVC
if(MSVC)
set_target_properties(libglfw PROPERTIES
    IMPORTED_LOCATION_DEBUG "${BINARY_DIR}/src/Debug/${GLFW_LIB_FILE}"
    IMPORTED_LOCATION_RELEASE "${BINARY_DIR}/src/Release/${GLFW_LIB_FILE}"
)
endif()

include_directories(${SOURCE_DIR}/include)

# SOIL2 -----------------------------------------------------------------------
add_subdirectory(SOIL2)
include_directories(SOIL2)

# glm -------------------------------------------------------------------------
ExternalProject_Add(
    glm
    URL "https://github.com/g-truc/glm/releases/download/0.9.7.0/glm-0.9.7.0.7z"
    DOWNLOAD_NO_PROGRESS 1
    PREFIX ${CMAKE_BINARY_DIR}/glm
    # we just need the library file, no tests and examples please
    BUILD_COMMAND ""
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(glm SOURCE_DIR BINARY_DIR)

include_directories(${SOURCE_DIR})

# add src subdirectory
add_subdirectory(src)
