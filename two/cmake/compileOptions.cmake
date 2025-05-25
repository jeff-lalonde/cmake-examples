message(STATUS "Setting compile options for library ${library}")

# Create the compile options interface library.
add_library(${library}CompileOptions INTERFACE)

# Enabled c++ 20.
target_compile_features(${library}CompileOptions INTERFACE cxx_std_20)

# Set compile options for GCC-like compilers.
set(gcc_options 
    -Werror             # Turn all warnings into errors.
    -Wall               # Basic warnings.
    -Wextra             # Additional warnings not in -Wall.
    -Wpedantic          # ISO standard enforcement.
    -Wunused            # Warn on unused functions, variables and parameters.
    -Wconversion        # Warn on implicit conversions.
    -Wshadow            # Warn on variable shadowing.
    -Wformat=2          # Warn on string format specifier-argument mismatches in printf, sprintf, scanf.
    -Wfloat-equal       # Warn on comparing floats with ==.
    -Wcast-align        # Warn on potentially unaligned casts.
)

# Set compile options for MSVC.
set(msvc_options -W3)

# GCC-like compilers.
set(gcc_cxx "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU,LCC>")

# MSVC compiler.
set(msvc_cxx "$<COMPILE_LANG_AND_ID:CXX,MSVC>")

# Add compile options when building.
target_compile_options(${library}CompileOptions INTERFACE
    $<${gcc_cxx}:$<BUILD_INTERFACE:${gcc_options}>>
    $<${msvc_cxx}:$<BUILD_INTERFACE:${msvc_options}>>)

# Set compile definitions.
set(compile_definitions TWO_DEFINITION=2)

# Add compile definitions when building.
target_compile_definitions(${library}CompileOptions INTERFACE
    $<BUILD_INTERFACE:${compile_definitions}>)