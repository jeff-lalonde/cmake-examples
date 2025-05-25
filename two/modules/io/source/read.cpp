#include "two/io/read.hpp"

#include <filesystem>
#include <fstream>
#include <stdexcept>
#include <string>

namespace two
{
namespace io
{

std::string read(const std::string& path)
{
    // Open the file.
    std::ifstream file(path, std::ios::binary);
    if (!file) throw std::ios_base::failure("Failed to open file.");

    // Allocate the text string.
    const size_t size = std::filesystem::file_size(path);
    std::string text(size, '\0');

    // Read the file.
    file.read(text.data(), size);

    // Return the text.
    return text;
}

}  // namespace io
}  // namespace two
