cmake_minimum_required(VERSION 3.23)
project(eigen_external LANGUAGES CXX)

include(ExternalProject)

# Set default build type if not specified
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# Download and install Eigen Solver
ExternalProject_Add(
  eigen
  GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
  GIT_TAG        3.4.0
  GIT_SHALLOW ON
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DBUILD_TESTING=OFF
    -DEIGEN_BUILD_DOC=OFF
    -DEIGEN_BUILD_PKGCONFIG=OFF
)

# Add info message
message(STATUS "Eigen 3.4.0 ${CMAKE_BUILD_TYPE} will be installed to: ${CMAKE_INSTALL_PREFIX}")