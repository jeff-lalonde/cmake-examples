if(NOT DEFINED library OR library STREQUAL "")
    # Set the library name to the project name.
    set(library ${PROJECT_NAME})
endif()

# Set the library module name.
set(module io)

# List all header and source files.
file(GLOB_RECURSE headers CONFIGURE_DEPENDS include/*.hpp)
file(GLOB_RECURSE sources CONFIGURE_DEPENDS source/*.cpp)

# Create the library module target.
add_library(${module})

target_sources(${module}
    PUBLIC
        FILE_SET ${module}Headers
        TYPE HEADERS
        BASE_DIRS include
        FILES ${headers}
    PRIVATE 
        ${sources})

# Create the compile options interface library if it doesn't already exist.
if (NOT TARGET compileOptions)
    include(${PROJECT_SOURCE_DIR}/../compileOptions.cmake)
endif()

# Set compile options via the interface library 'compileOptions'.
target_link_libraries(${module} PRIVATE compileOptions)

# Set the library version for the build.
set_target_properties(${module} PROPERTIES
    OUTPUT_NAME ${library}-${module}
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})


##########################################################
#                    INSTALL TARGET                      #
##########################################################

# Include GNU standard installation directories.
include(GNUInstallDirs)

# Create the install target.
install(
    TARGETS ${module}
    EXPORT ${library}Targets
    FILE_SET ${module}Headers
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
