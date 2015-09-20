# Add the example target
add_executable(example example.cpp)

# link our libraries
target_link_libraries(example
  ${GL3W_LIBRARIES}
  ${GLFW_LIBRARIES}
  ${SOIL2_LIBRARIES}
  ${OPENGL_LIBRARIES}
)
