#include <CeresLib/CeresLib.hpp>
#include <CeresLib/version.hpp>

#include <cmath>
#include <cstdint>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

static inline bool IsSquare(uint64_t n)
{
    const size_t r = static_cast<size_t>(std::round(std::sqrt(static_cast<double>(n))));
    return r * r == n;
}

/// Pretty-prints a square matrix that is stored row-major in a flat vector.
/// @param data   flat vector holding N×N elements in row order
/// @param width  column width for each number (default 10)
/// @param prec   digits after the decimal point (default 3)
void PrintMatrix(const double* data, size_t rows, size_t cols, int width = 12, int prec = 5)
{
    std::cout << std::fixed << std::setprecision(prec);

    for (std::size_t r = 0; r < rows; ++r)
    {
        for (std::size_t c = 0; c < cols; ++c)
        {
            std::cout << std::setw(width) << data[r * cols + c];
        }
        std::cout << '\n';
    }

    // restore default format if you care:
    std::cout.unsetf(std::ios_base::floatfield);
}

int main()
{
    std::cout << "EigenApp version: " << APP_VERSION << std::endl;
    std::cout << "CeresLib version: " << CeresLib::version::string << std::endl;

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

    std::cout << std::endl;

    // Test CeresLib:
    CeresLib::CeresTest();

    return 0;
}