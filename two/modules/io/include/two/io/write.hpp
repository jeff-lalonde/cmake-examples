#pragma once

#include <string>

namespace two
{
namespace io
{

/**
 * @brief Write a text file.
 * @param path The filesystem path to the text file.
 * @param text The text to write to the file.
 */
void write(const std::string& path, const std::string& text);

}  // namespace io
}  // namespace two
