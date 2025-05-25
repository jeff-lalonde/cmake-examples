#include "two/io/write.hpp"

#include <fstream>
#include <stdexcept>

namespace two
{
namespace io
{

void write(const std::string& path, const std::string& text)
{
    // Open the file.
    std::ofstream file(path, std::ios::binary);
    if (!file) throw std::ios_base::failure("Failed to open file for writing.");

    // Write the text.
    file.write(text.data(), text.size());
}

}  // namespace io
}  // namespace two
