#include <one/one.hpp>
#include <one/version.hpp>

#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
    std::cout << "app version: " << APP_VERSION << std::endl;
    std::cout << "one version: " << one::version::string << std::endl;

#ifdef NDEBUG
    std::cout << "Build type: Release" << std::endl;
#else
    std::cout << "Build type: Debug" << std::endl;
#endif

#ifdef PRODUCTION
    std::cout << "PRODUCTION: ON" << std::endl;
#else
    std::cout << "PRODUCTION: OFF" << std::endl;
#endif

#ifdef APP_DEFINITION
    std::cout << "APP_DEFINITION: " << APP_DEFINITION << std::endl;
#endif

    if (argc < 2)
    {
        std::cout << "\nProvide a number for which the square root is computed." << std::endl;
        std::cout << "Example: " << argv[0] << " <number>" << std::endl;
        return 1;
    }

    // Test one library:
    const double x = std::stod(argv[1]);
    const double y = one::sqrt(x);

    std::cout << "sqrt(" << x << ") = " << y << std::endl;

    return 0;
}