#pragma once

#include <string>

namespace two
{
namespace io
{

/**
 * @brief Read a text file.
 * @param path The filesystem path to the text file.
 * @return The text read from the file.
 */
std::string read(const std::string& path);

}  // namespace io
}  // namespace two
