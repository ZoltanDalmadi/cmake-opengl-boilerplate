# Add the example target
add_executable(example example.cpp)

# link our libraries
target_link_libraries(example
    libgl3w
	libglfw
	${OPENGL_LIBRARIES}
)