cmake_minimum_required(VERSION 3.23)
project(ceres_external LANGUAGES CXX)

include(ExternalProject)

# Set default build type if not specified
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

if(NOT Eigen3_DIR)
    message(STATUS "Eigen3_DIR not set, using default.")
    set(Eigen3_DIR "${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake" CACHE PATH "Eigen3 directory" FORCE)
endif()

if (NOT EXISTS "${Eigen3_DIR}")
  message(FATAL_ERROR "Eigen directory ${Eigen3_DIR} does not exist.")
endif()

# Download and install Ceres Solver
ExternalProject_Add(
  ceres-solver
  GIT_REPOSITORY https://github.com/ceres-solver/ceres-solver.git
  GIT_TAG 2.2.0
  GIT_SHALLOW ON
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_BENCHMARKS=OFF
    -DMINIGLOG=ON
    -DPROVIDE_UNINSTALL_TARGET=OFF
    -DEigen3_DIR=${Eigen3_DIR}
)

# Add info message
message(STATUS "Ceres Solver 2.2 ${CMAKE_BUILD_TYPE} will be installed to: ${CMAKE_INSTALL_PREFIX}")