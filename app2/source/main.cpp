#include <two/core/core.hpp>
#include <two/io.hpp>
#include <two/math.hpp>
#include <two/version.hpp>

#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
    std::cout << "app version: " << APP_VERSION << std::endl;
    std::cout << "two version: " << two::version::string << std::endl;

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

    // Test math module.
    const double x = 1.2456;
    const double y = two::math::sqrt(x);
    const double z = two::math::exp(y);
    std::cout << "sqrt(" << x << ") = " << y << std::endl;
    std::cout << "exp(" << x << ")  = " << z << std::endl;

    if (argc < 2)
    {
        std::cout << "\nOptional: Provide a text file to read." << std::endl;
        std::cout << "Example: " << argv[0] << " <text file to read>" << std::endl;
    }
    else
    {
        // Test io module.
        const std::string path = argv[1];
        const std::string text = two::io::read(path);

        // Test core module.
        two::core::print("\nText file:\n" + text);
    }

    return 0;
}