function(add_module modulePath)

# Return if the module path is not a directory.
if (NOT IS_DIRECTORY "${modulePath}")
    return()
endif()

# Use the directory name as the module name.
get_filename_component(module "${modulePath}" NAME)

message(STATUS "Adding module ${module}")

# List all header and source files.
file(GLOB_RECURSE headers CONFIGURE_DEPENDS ${modulePath}/include/*.hpp)
file(GLOB_RECURSE sources CONFIGURE_DEPENDS ${modulePath}/source/*.cpp)

# Create the library module target.
add_library(${module})

# Add the module sources.
target_sources(${module}
    PUBLIC
        FILE_SET ${module}Headers
        TYPE HEADERS
        BASE_DIRS ${modulePath}/include
        FILES ${headers}
    PRIVATE 
        ${sources})

# Set the library version for the build.
set_target_properties(${module} PROPERTIES
    OUTPUT_NAME ${library}-${module}
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})

# Set the module compile options.
target_link_libraries(${module} PRIVATE ${library}CompileOptions)

# Add the module to the library interface.
target_link_libraries(${library} INTERFACE ${module})

# Include GNU standard installation directories.
include(GNUInstallDirs)

# Add the module to the library install target.
install(
    TARGETS ${module}
    EXPORT ${library}Targets
    FILE_SET ${module}Headers
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

endfunction()

# List all the filesystem entries in the modules path.
file(GLOB modulePaths CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/modules/*")

# Add each module in the modules path.
foreach(modulePath IN LISTS modulePaths)
    add_module(${modulePath})
endforeach()