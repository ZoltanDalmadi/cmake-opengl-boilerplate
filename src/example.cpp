#include <iostream>
#include <GL/gl3w.h>
#include <GLFW/glfw3.h>

int main()
{
  GLFWwindow* window;

  // Initialize the library
  if (!glfwInit())
    return -1;

  // Create a windowed mode window and its OpenGL context
  window = glfwCreateWindow(800, 600, "CMake OpenGL Boilerplate", NULL, NULL);

  if (!window) {
    glfwTerminate();
    return -1;
  }

  // Make the window's context current
  glfwMakeContextCurrent(window);

  // Initialize gl3w
  if (gl3wInit()) {
    std::cerr << "failed to initialize OpenGL" << std::endl;
    return -1;
  }

  // Print OpenGL information
  std::cout << "OpenGL " << glGetString(GL_VERSION)
            << ", GLSL " << glGetString(GL_SHADING_LANGUAGE_VERSION)
            << std::endl;

  // set window background to a nice blueish color
  glClearColor(0.275f, 0.510f, 0.706f, 1.0f);

  // Loop until the user closes the window
  while (!glfwWindowShouldClose(window)) {
    // Poll for and process events
    glfwPollEvents();

    glClear(GL_COLOR_BUFFER_BIT);

    // Render here

    // Swap front and back buffers
    glfwSwapBuffers(window);
  }

  glfwTerminate();
  return 0;
}
