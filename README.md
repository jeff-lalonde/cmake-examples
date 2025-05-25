# CMake Examples

Modern, practical CMake examples for building, installing and packaging C++ libraries and executables.

CMake features include

- Setting header files with [File Sets](https://cmake.org/cmake/help/latest/command/target_sources.html#file-sets).
- Setting compile options with [Interface Libraries](https://cmake.org/cmake/help/v3.4/command/add_library.html#interface-libraries).

- Custom CMake modules that separate configuration steps and are easily reusable in other projects.
- Library install targets with versioned packaging so the library can be consumed with `find_package(YourLib 1.2.3)`
- Installer/package generation (e.g. [DEB](https://www.debian.org/doc/manuals/debian-faq/pkg-basics.en.html#package), [NSIS](https://nsis.sourceforge.io/Main_Page) ) with [CPack](https://cmake.org/cmake/help/latest/module/CPack.html).

## 📁 Contents

### CMake projects

There are four CMake project examples:
- [one](one/README.md): A simple library that builds a single shared or static library.
- [two](two/README.md): A library that builds multiple shared or static modules libraries.
- [app1](app1/README.md): An executable that consumes library [one](one/README.md).
- [app2](app2/README.md): An executable that consumes library [two](two/README.md).

### Scripts

There are scripts for conveniently building, installing, packaging and cleaning any of the CMake projects.
- [build](scripts/build): Configure and build a CMake project.
- [install](scripts/install): Configure, build and install a CMake project.
- [package](scripts/package): Configure, build and package a CMake project.
- [clean](scripts/clean): Remove the build and install directories of a CMake project.
- [clean-all](scripts/clean-all): Clean the build and install directories for all CMake projects.

## 🛠️ Build the examples

### Prerequisites 

To build the CMake examples, you will need

- CMake 3.23 or higher
- A C++ compiler

### Clone the repository. 

```bash
git clone https://github.com/jeff-lalonde/cmake-examples.git
cd cmake-examples
```

### Build a CMake project

- [build library one]()
- [build library two]()
- [build executable app1]()
- [build executable app2]()

## 🤝 Contribute

Contributions are welcome!  Feel free to [report a bug, request a feature](https://github.com/jeff-lalonde/cmake-examples/issues), or submit a pull request.
