find_package(Eigen3 3.4 QUIET PATHS ${dependenciesInstallPrefix} NO_DEFAULT_PATH)

if(NOT Eigen3_FOUND)
    execute_process(
        COMMAND ${scriptsPath}/build ${dependenciesPath}/eigen -DCMAKE_INSTALL_PREFIX=${dependenciesInstallPrefix}
        RESULT_VARIABLE result)
    
    if(NOT result EQUAL 0)
        message(FATAL_ERROR "Failed to install Eigen.")
    endif()
    
    find_package(Eigen3 3.4 REQUIRED PATHS ${dependenciesInstallPrefix} NO_DEFAULT_PATH)
endif()

target_link_libraries(${library} PRIVATE Eigen3::Eigen)
