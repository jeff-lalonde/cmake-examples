#include "EigenLib/EigenLib.hpp"

#include <stdexcept>

#include <Eigen/Dense>

namespace EigenLib
{

void InvertMatrix(double* matrixOut, const double* matrixIn, size_t size)
{
    if (!matrixIn || !matrixOut || size == 0)
    {
        throw std::invalid_argument("Null pointer or zero size provided.");
    }

    // Define a row-major dynamic matrix type
    using MatrixType = Eigen::Matrix<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor>;

    // Map the input and output buffers
    Eigen::Map<const MatrixType> input(matrixIn, size, size);
    Eigen::Map<MatrixType> output(matrixOut, size, size);

    // Check invertibility (optional, but good for safety)
    if (input.determinant() < 1.0e-24)
    {
        throw std::runtime_error("Matrix is singular and cannot be inverted.");
    }

    // Perform inversion
    output = input.inverse();
}

}  // namespace EigenLib