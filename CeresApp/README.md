## app1 executable example

`app1` is and executable that consumes library [one](../one/README.md).

### 🛠️ Build app1

Configure and build app1 with CMake

```bash
# CMake configure.
cmake -H./app1 -B./app1/build

# CMake build.
cmake --build ./app1/build
```

or run the build script, which does the same thing.

```bash
# Configure and build app1 with CMake
scripts/build app1
```

### 🏃 Run app1 

Run app1 in the build directory.

```bash
# Run app1 in the build directory and compute the square root of 25.
app1/build/app1 25
```

You should see the output

```
app version: 1.2.3
one version: 1.0.0
Build type: Release
PRODUCTION: ON
APP_DEFINITION: 42
sqrt(25) = 5
```

### Install app1 in the app1 project directory.

The app1 CMAKE_INSTALL_PREFIX is set to `app1/install` by default.
After configuring and building app1, install it with CMake
```bash
# CMake install.
cmake --install ./app1/build
```

or run the install script, which does the same thing.

```bash
# Install app1 with CMake
scripts/install app1
```

### 🏃 Run app1 in the install directory 

Run app1 in the install directory.

```bash
# Run app1 in the install directory and compute the square root of 25.
app1/install/bin/app1 25
```

Note that app1's dependency, library [one](../one/README.md) is installed with it.

### 📦 Package app1

After configuring and building app1, create a DEB package (Linux) or NSIS installer (Windows)

```bash
# Go to the build directory.
cd app1/build

# Generate the package/installer.
cpack
```

or run the package script, which does the same thing:

```bash
# Package app1 with CMake
scripts/package app1
```

The DEB package / NSIS installer is created in app1 build directory, e.g. `app1/build/app1_1.2.3_amd64.deb`.

### Build app1 with installed one library package.

First install `one` library in its project directory `one/install`

```bash
# Install one with CMake
scripts/install one
```

Then build app1 with `-DUSE_LIBRARY_PACKAGE=ON`.
This includes the library with `find_package` instead of `add_subdirectory`.

```bash
# Install app1 with CMake
scripts/build app1 -DUSE_LIBRARY_PACKAGE=ON
```

### Install app1 with installed one library package.

First install `one` library in its project directory `one/install`

```bash
# Install one with CMake
scripts/install one
```

Then install app1 with `-DUSE_LIBRARY_PACKAGE=ON` and `-DINSTALL_LIBRARY_PACKAGE=ON` to include the `one` shared library in the installation.


```bash
# Install app1 with CMake
scripts/install app1 -DUSE_LIBRARY_PACKAGE=ON -DINSTALL_LIBRARY_PACKAGE=ON

```