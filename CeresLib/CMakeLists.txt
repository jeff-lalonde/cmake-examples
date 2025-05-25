# Require CMake 3.23 for file sets.
cmake_minimum_required(VERSION 3.23)

# Set the project name, version and description.
project(CeresLib VERSION 1.0.0 DESCRIPTION "A library with Ceres as a dependency.")

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

# List all header and source files.
file(GLOB_RECURSE headers CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp)
file(GLOB_RECURSE sources CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/source/*.cpp)

# Add the version header to the list of headers.
list(APPEND headers ${versionHeader})

# Create the library target.
add_library(${library})

string(TOLOWER "${library}" libraryLowerCase)

# Add the library sources.
target_sources(${library}
PUBLIC
    FILE_SET ${libraryLowerCase}Headers
    TYPE HEADERS
    BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_CURRENT_BINARY_DIR}/include
    FILES ${headers}
PRIVATE 
    ${sources})

# Set the library version for the build.
set_target_properties(${library} PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})

# Add alias so that consuming targets can link to ${library}::${library}
# whether included with add_subdirectory or find_package.
add_library(${library}::${library} ALIAS ${library})

# Add the CMake module path.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Fetch dependencies with CMake FetchContent.
include(dependencies)

# Set compile options with an interface library.
include(compileOptions)

# Create the library install target.
include(install)

# Package the library with CPack.
include(cpack)
