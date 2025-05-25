find_package(Ceres 2.2 QUIET PATHS ${dependenciesInstallPrefix} NO_DEFAULT_PATH)

if(NOT Ceres_FOUND)
    execute_process(
        COMMAND ${scriptsPath}/build ${dependenciesPath}/ceres -DCMAKE_INSTALL_PREFIX=${dependenciesInstallPrefix}
        RESULT_VARIABLE result)
    
    if(NOT result EQUAL 0)
        message(FATAL_ERROR "Failed to install Ceres.")
    endif()
    
    find_package(Ceres 2.2 REQUIRED PATHS ${dependenciesInstallPrefix} NO_DEFAULT_PATH)
endif()

target_link_libraries(${library} PRIVATE Ceres::ceres)