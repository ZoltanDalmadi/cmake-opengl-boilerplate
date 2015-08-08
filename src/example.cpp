#include <iostream>
#include <GL/gl3w.h>
#include <GLFW/glfw3.h>
#include <SOIL2.h>

#define WIDTH  800
#define HEIGHT 600

void key_callback(GLFWwindow* window, int key, int scancode, int action,
                  int mode)
{
  if ((key == GLFW_KEY_ESCAPE || key == GLFW_KEY_Q) && action == GLFW_PRESS)
    glfwSetWindowShouldClose(window, GL_TRUE);

  if ((key == GLFW_KEY_S) && action == GLFW_PRESS) {
    SOIL_save_screenshot("awesomenessity.bmp",
                         SOIL_SAVE_TYPE_BMP,
                         0, 0, WIDTH, HEIGHT);
  }
}

int main()
{
  // Initialize the library
  if (!glfwInit())
    return -1;

  // Create a windowed mode window and its OpenGL context
  GLFWwindow* window = glfwCreateWindow(WIDTH, HEIGHT,
                                        "CMake OpenGL Boilerplate", NULL, NULL);

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

  glfwSetKeyCallback(window, key_callback);

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
