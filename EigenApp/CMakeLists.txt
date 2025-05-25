# Require CMake 3.23 for file sets.
cmake_minimum_required(VERSION 3.23)

# Set the project name, version and description.
project(eigenapp VERSION 1.2.3 DESCRIPTION "Application example with EigenLib library dependency.")

# Build options.
option(PRODUCTION "Build in production mode." ON)
option(USE_LIBRARY_PACKAGE "Include the library with find_package instead of add_subdirectory." OFF)
option(INSTALL_LIBRARY_PACKAGE "Install the shared library with the executable." OFF)

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

# Set the library name for this example.
set(library EigenLib)

# Set the absolute projects path.
get_filename_component(projectsPath ${CMAKE_CURRENT_LIST_DIR}/.. ABSOLUTE)

if(USE_LIBRARY_PACKAGE)
    # Find the 'EigenLib' package.
    find_package(${library} 1.0.0 REQUIRED PATHS ${projectsPath}/${library}/install NO_DEFAULT_PATH)
else()
    # Add the 'EigenLib' library as a subdirectory
    add_subdirectory(${projectsPath}/${library} ${projectsPath}/${library}/build)
endif()

# Set the app name to the project name.
set(app ${PROJECT_NAME})

# Add the executable target.
add_executable(${app})

# Set the executable sources.
target_sources(${app} PRIVATE source/main.cpp)

# Add the library dependencies.
target_link_libraries(${app} PRIVATE ${library}::${library})

# Add the CMake module path.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Set compile options with an interface library.
include(compileOptions)

# Link all static libraries on windows.
if (WIN32)
    target_link_options(${app} PUBLIC "-static")
endif()

# Create the executable install target.
include(install)

# Package library with CPack.
include(cpack)
