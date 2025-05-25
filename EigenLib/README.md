# one library example

`one` is simple library that builds a single shared or static library.

### 🛠️ Build one

Configure and build one with CMake

```bash
# CMake configure.
cmake -H./one -B./one/build

# CMake build.
cmake --build ./one/build
```

or run the build script, which does the same thing.

```bash
# Configure and build one with CMake
scripts/build one
```

### Install one in the project directory.

The one CMAKE_INSTALL_PREFIX is set to `one/install` by default.  After configuring and building one, install it with CMake
```bash
# CMake install.
cmake --install ./one/build
```

or run the install script, which does the same thing.

```bash
# Install one with CMake
scripts/install one
```

### 📦 Package one

After configuring and building one, create a DEB package (Linux) or NSIS installer (Windows)

```bash
# Go to the build directory.
cd one/build

# Generate the package/installer.
cpack
```

or run the package script, which does the same thing:

```bash
# Package one with CMake
scripts/package one
```

The DEB package / NSIS installer is created in the one build directory, e.g. `one/build/one_1.0.0_amd64.deb`.