# Require CMake 3.23 for file sets.
cmake_minimum_required(VERSION 3.23)

# Set the project name, version and description.
project(two VERSION 1.0.0 DESCRIPTION "Multi-module library example.")

# Build shared libraries by default.
option(BUILD_SHARED_LIBS "Build as a shared library." ON)

# Set the default build type to Release if not specified.
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type." FORCE)
endif()

# Set default install prefix in the project directory.
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set_property(CACHE CMAKE_INSTALL_PREFIX PROPERTY VALUE "${CMAKE_CURRENT_SOURCE_DIR}/install")
    # Set default flag to false so that consumed projects don't override the install directory.
    set (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT FALSE)
endif()

# Set the library name to the project name.
set(library ${PROJECT_NAME})

# Set the library version for the runtime.
set(versionHeader ${CMAKE_CURRENT_BINARY_DIR}/include/${library}/version.hpp)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/version.hpp.in ${versionHeader})

# Create the interface library target.
add_library(${library} INTERFACE)

# Add the library version header.
target_sources(${library}
INTERFACE
    FILE_SET ${library}Headers
    TYPE HEADERS
    BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/include
    FILES ${versionHeader}
)

# Add alias so that consuming targets can link to ${library}::${library}
# whether included with add_subdirectory or find_package.
add_library(${library}::${library} ALIAS ${library})

# Create an interface library to encapsulate the compile options.
include(cmake/compileOptions.cmake)

# Add the modules in the modules directory.
include(cmake/addSubmodules.cmake)

# Create the library install target.
include(cmake/install.cmake)

# Package library with CPack.
include(cmake/cpack.cmake)
