#pragma once

#include <cstddef>

namespace EigenLib
{

/**
 * @brief Compute the square root of a number with std::sqrt.
 * @param number The number for which to compute the square root.
 * @return The square root of the number.
 */
void InvertMatrix(double* matrixOut, const double* matrixIn, size_t size);

}  // namespace EigenLib