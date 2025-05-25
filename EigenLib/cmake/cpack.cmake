message(STATUS "Configuring CPack")

# Set a default path if it exists and is not user-defined.
function(set_default_path variable path description)
    if (EXISTS "${path}")
        set(${variable} "${path}" CACHE STRING "${description}")
    endif()
endfunction()

# Include required runtime libraries.
include(InstallRequiredSystemLibraries)

# Set package name as the project name.  Make sure it is lower case.
string(TOLOWER ${PROJECT_NAME} CPACK_PACKAGE_NAME)

# Package description is the project description by default.
# set(CPACK_PACKAGE_DESCRIPTION ${PROJECT_DESCRIPTION})

# Set package version as the project version.
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# Identify yourself.
set(CPACK_PACKAGE_VENDOR "me")
set(CPACK_PACKAGE_CONTACT "me@email.com")

# Add a license file if it exists.
set_default_path(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE" "CPack license file")

# Add a readme file if it exists.
set_default_path(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md" "CPack readme file")

# Set the default generator for each platform.
if (WIN32)
    # On Windows use NSIS (Nullsoft Scriptable Install System).
    set(DEFAULT_CPACK_GENERATOR NSIS)
elseif (APPLE)
    # On MacOS use DragNDrop package.
    set(DEFAULT_CPACK_GENERATOR DragNDrop)
elseif (UNIX)
    # On Linux use debian package.
    set(DEFAULT_CPACK_GENERATOR DEB)
endif()

# Allow the user-specified genertor(s), e.g. -DCPACK_GENERATOR='TGZ;DEB'
set(CPACK_GENERATOR "${DEFAULT_CPACK_GENERATOR}" CACHE STRING "CPack generator")

# Check if debian package properties if it is among the selected generators.
if ("DEB" IN_LIST CPACK_GENERATOR)
    # Set package maintainer, vender and contact.
    set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${CPACK_PACKAGE_VENDOR} <${CPACK_PACKAGE_CONTACT}>")

    # List package dependencies automatically.
    set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

    # Use the default debian package filename: <name>_<version>_<architecture>.deb
    set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
endif()

# Include CPack.
include(CPack)