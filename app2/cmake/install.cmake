message(STATUS "Configuring install target for executable ${app}")

# Include GNU standard installation directories.
include(GNUInstallDirs)

# Install the executable.
install(
    TARGETS ${app}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# Set relative path to installed shared libraries.
set_target_properties(${app} PROPERTIES INSTALL_RPATH "$ORIGIN/../lib")

# Install 'two' shared library if included with find_package.
if (USE_LIBRARY_PACKAGE AND INSTALL_LIBRARY_PACKAGE)

    # Get the library type (static, shared, interface, module).
    get_target_property(libraryType ${library}::${library} TYPE)

    if (libraryType STREQUAL "SHARED_LIBRARY")

        # Install the shared library (.so, .dll) files.
        install(IMPORTED_RUNTIME_ARTIFACTS ${library}::${library})

    elseif (libraryType STREQUAL "INTERFACE_LIBRARY")

        # Get all the library modules.
        get_target_property(modules ${library}::${library} INTERFACE_LINK_LIBRARIES)

        # Install the shared library (.so, .dll) files of each module.
        foreach(module IN LISTS modules)
            # Make sure module is a target.
            if(TARGET ${module})
                # Get the module type (static, shared, interface, module).
                get_target_property(moduleType ${module} TYPE)

                if (moduleType STREQUAL "SHARED_LIBRARY")
                    # Install the module shared library (.so, .dll) files.
                    install(IMPORTED_RUNTIME_ARTIFACTS ${module})
                endif()
            endif()
        endforeach()

    endif()
endif()