# two library example

`two` is library with multiple modules.  Each module builds its own shared or static library.  The modules are encapsulated in a top-level interface library.

### 🛠️ Build two

Configure and build two with CMake

```bash
# CMake configure.
cmake -H./two -B./two/build

# CMake build.
cmake --build ./two/build
```

or run the build script, which does the same thing.

```bash
# Configure and build two with CMake
scripts/build two
```

### Install two in the project directory.

The two CMAKE_INSTALL_PREFIX is set to `two/install` by default.  After configuring and building two, install it with CMake
```bash
# CMake install.
cmake --install ./two/build
```

or run the install script, which does the same thing.

```bash
# Install two with CMake
scripts/install two
```

### 📦 Package two

After configuring and building two, create a DEB package (Linux) or NSIS installer (Windows)

```bash
# Go to the build directory.
cd two/build

# Generate the package/installer.
cpack
```

or run the package script, which does the same thing:

```bash
# Package two with CMake
scripts/package two
```

The DEB package / NSIS installer is created in the two build directory, e.g. `two/build/two_1.0.0_amd64.deb`.