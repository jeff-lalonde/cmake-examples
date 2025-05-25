message(STATUS "Configuring install target for library ${library}")

# Include GNU standard installation directories.
include(GNUInstallDirs)

# Create the install target.
install(
    TARGETS ${library} ${library}CompileOptions
    EXPORT ${library}Targets
    FILE_SET ${libraryLowerCase}Headers
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# Set the standard cmake install path for the library.
set(cmakeInstallPath ${CMAKE_INSTALL_DATADIR}/${library}/cmake)

# Export the library target for find_package.
install(
    EXPORT ${library}Targets
    DESTINATION ${cmakeInstallPath}
    NAMESPACE ${library}::
)

# Include the helper functions for creating config files for find_package.
include(CMakePackageConfigHelpers)

# Create a Config.cmake file.
configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${library}Config.cmake
    INSTALL_DESTINATION ${cmakeInstallPath})

# Create a ConfigVersion.cmake file.
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${library}ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion)

# Install Config.cmake and ConfigVersion.cmake.    
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${library}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${library}ConfigVersion.cmake
    DESTINATION ${cmakeInstallPath})