# Add the example target
add_executable(example example.cpp)

# link our libraries
target_link_libraries(example
  ${GL3W_LIBRARIES}
  ${GLFW_LIBRARIES}
  ${SOIL2_LIBRARIES}
  ${OPENGL_LIBRARIES}
)

if (UNIX)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lrt -lm -lXrandr \
  -lXinerama -lXi -lXcursor -lXrender -lGL -lm -lpthread -ldl -ldrm \
  -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-dri2 -lxcb-dri3 -lxcb-present \
  -lxcb-randr -lxcb-xfixes -lxcb-render -lxcb-shape -lxcb-sync -lxshmfence \
  -lXxf86vm -lXext -lX11 -lpthread -lxcb -lXau -lXdmcp")
endif()
