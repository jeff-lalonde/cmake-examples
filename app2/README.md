## app2 executable example

`app2` is and executable that consumes library [two](../two/README.md).

### 🛠️ Build app2

Configure and build app2 with CMake

```bash
# CMake configure.
cmake -H./app2 -B./app2/build

# CMake build.
cmake --build ./app2/build
```

or run the build script, which does the same thing.

```bash
# Configure and build app2 with CMake
scripts/build app2
```

### 🏃 Run app2 

Run app2 in the build directory.

```bash
# Run app2 in the build directory.
app2/build/app2
```

You should see the output

```
app version: 1.2.3
two version: 1.0.0
Build type: Release
PRODUCTION: ON
APP_DEFINITION: 42
sqrt(1.2456) = 1.11606
exp(1.2456)  = 3.05282

Optional: Provide a text file to read.
Example: app2/build/app2 <text file to read>

```

### Install app2 in the project directory.

The app2 CMAKE_INSTALL_PREFIX is set to `app2/install` by default.
After configuring and building app2, install it with CMake
```bash
# CMake install.
cmake --install ./app2/build
```

or run the install script, which does the same thing.

```bash
# Install app2 with CMake
scripts/install app2
```

### 🏃 Run app2 in the install directory 

Run app2 in the install directory.

```bash
# Run app2 in the install directory and compute the square root of 25.
app2/install/bin/app2 25
```

Note that app2's dependency, library [two](../two/README.md) is installed with it.

### 📦 Package app2

After configuring and building app2, create a DEB package (Linux) or NSIS installer (Windows)

```bash
# Go to the build directory.
cd app2/build

# Generate the package/installer.
cpack
```

or run the package script, which does the same thing:

```bash
# Package app2 with CMake
scripts/package app2
```

The DEB package / NSIS installer is created in app2 build directory, e.g. `app2/build/app2_1.2.3_amd64.deb`.

### Build app2 with installed two library package.

First install `two` library in its project directory `two/install`

```bash
# Install two with CMake
scripts/install two
```

Then build app2 with `-DUSE_LIBRARY_PACKAGE=ON`.
This includes the library with `find_package` instead of `add_subdirectory`.

```bash
# Install app2 with CMake
scripts/build app2 -DUSE_LIBRARY_PACKAGE=ON
```

### Install app2 with installed two library package.

First install `two` library in its project directory `two/install`

```bash
# Install two with CMake
scripts/install two
```

Then install app2 with `-DUSE_LIBRARY_PACKAGE=ON` and `-DINSTALL_LIBRARY_PACKAGE=ON` to include the `two` shared library in the installation.


```bash
# Install app2 with CMake
scripts/install app2 -DUSE_LIBRARY_PACKAGE=ON -DINSTALL_LIBRARY_PACKAGE=ON

```