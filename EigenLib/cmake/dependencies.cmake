message(STATUS "Fetching dependencies for ${library}")

set(dependenciesPath "${CMAKE_CURRENT_SOURCE_DIR}/../dependencies" CACHE PATH "")
set(dependenciesInstallPrefix "${dependenciesPath}/install")
set(scriptsPath "${CMAKE_CURRENT_SOURCE_DIR}/../scripts" CACHE PATH "")

include(eigen)