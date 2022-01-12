# Installation using CMake


Reaktoro has several software and library dependencies that need to be
pre-installed for its successful compilation and installation using
[CMake](https://cmake.org/). To greatly simplify the building process of
Reaktoro for Linux, Windows, and macOS, you'll need
[Conda](https://conda.io/docs/).

Please follow the [Conda installation steps](installing_conda) before
proceeding with the instructions below.

```{attention}
If you do not want to rely on Conda for facilitating the process of building
Reaktoro from source, you'll need to manually install all dependencies listed
in the file [`environment.devenv.yml`][environment.devenv.yml].
```

[environment.devenv.yml]: https://github.com/reaktoro/reaktoro/blob/main/environment.devenv.yml

## Installing conda-devenv

Reaktoro relies on [conda-devenv](https://github.com/ESSS/conda-devenv), a tool
that conveniently allows us to manage different software dependencies across
Linux, Windows, and macOS operating systems using a single conda dependency
file `environment.devenv.yml` instead of multiple `environment.yml` files, one
for each system.

After installing `conda`, go to a terminal and execute:

~~~
conda install -n base conda-devenv
~~~

to install conda-devenv in the `base` conda environment.


## Downloading Reaktoro from GitHub

We need now to download the source code of Reaktoro, which is hosted on
[GitHub](https://github.com/reaktoro/reaktoro). This can be done by either
executing the following [git](https://git-scm.com/) command from the terminal
(ensure you already have git installed!):

~~~
git clone https://github.com/reaktoro/reaktoro.git
~~~

or by directly downloading
[reaktoro-main.zip](https://github.com/reaktoro/reaktoro/archive/main.zip),
the latest version of Reaktoro's source code in a zip file.

```{caution}
If you use the direct download option above, please unzip the downloaded file
in a directory of your choice. We assume the unzipped folder is named
`reaktoro` for the next installation steps, and not `reaktoro-main`! If you
are deloping Reaktoro, make sure you use `git clone` instead.
```

## Installing Reaktoro's software dependencies

Before building Reaktoro, we need to install all software dependencies needed
during the build process. We do not want, however, all these dependencies poluting our system and possibly causing conflicts and/or corrupting existing software.

This is achieved by installing all Reaktoro's dependencies in a dedicated [conda environment](https://conda.io/projects/conda/en/latest/user-guide/concepts/environments.html#conda-environments).

In the **root of the reaktoro directory**, execute:

~~~
conda devenv
~~~

This command will install all dependencies listed in
[`environment.devenv.yml`][environment.devenv.yml] in a conda environment named
`reaktoro`. This step can take a few minutes to complete for the first time.

```{attention}
You only need to execute `conda devenv` again when the list of external
dependencies changes or some configuration in the conda environment `reaktoro`
is altered.
```

## Building and installing Reaktoro with CMake

Before using `cmake` to configure, build, and install Reaktoro, you need to
**activate the conda environment** `reaktoro` that the `conda devenv` command
from the previous section created for us:

~~~
conda activate reaktoro
~~~

```{attention}
You need to activate the conda environment `reaktoro` whenever you use Reaktoro
from C++ or Python! This is because conda will adjust some environment
variables in your system (e.g., `PYTHONPATH`, `LD_LIBRARY_PATH`, `PATH`) so
that Reaktoro's libraries, executables, and Python packages can be found.
Activating the `reaktoro` conda environment is the simplest way to get these
environment variables set correctly.
```

You can now configure the build of Reaktoro (using default options) by
executing (assuming you are at the root of the reaktoro directory!):

~~~
cmake -S . -B build
~~~

which specifies that Reaktoro will be built in the directory `build`. The actual build operation happens when you execute the command:


```{tab} Linux and macOS
~~~
cmake --build build --parallel
~~~
```
```{tab} Windows
~~~
cmake --build build --config Release --parallel
~~~
```

```{danger}
In Linux and macOS, there is a risk of your system freezing with the command above because it will use all its computing cores and demand a lot of memory. If your system is not powerful enough and/or does not have plenty of memory, you should limit the number of parallel jobs. For example,

~~~
cmake --build build --parallel 3
~~~

will use only three parallel jobs.
```

```{admonition} Note for Windows users
In Windows, if you are using Microsoft Visual Studio, you'll need to ensure a **Release** build because some library dependencies in Reaktoro do not interact well with Reaktoro built in Debug mode (e.g., `yaml-cpp`).

**This is not an issue for Linux and macOS systems.**
```

## Running Reaktoro's tests

Reaktoro contains hundreds of tests and thousands of assertions to ensure that
everything has been implemented correctly. There are tests implemented in both
C++ and Python languages.

To execute all C++ and Python tests, run:

```{tab} Linux and macOS
~~~
cmake --build build --target tests
~~~
```
```{tab} Windows
~~~
cmake --build build --config Release --target tests
~~~
```

You can also run the C++ and Python tests individually:

```{tab} Linux and macOS
~~~
cmake --build build --target tests-cpp
cmake --build build --target tests-py
~~~
```
```{tab} Windows
~~~
cmake --build build --config Release --target tests-cpp
cmake --build build --config Release --target tests-py
~~~
```

```{admonition} Note for Windows users
If you encounter strange issues in Windows when running the tests, and some C++
tests fail, there is a chance this is a result of an accidental Debug build in
Windows instead of Release when using Microsoft Visual Studio. See previous
section.
```
## Building and running Reaktoro's C++ examples

Reaktoro contains many examples in C++ demonstrating its usage for various
applications. These examples live in the directory
[`examples/cpp`](https://github.com/reaktoro/reaktoro/tree/main/examples/cpp)
within the root directory of Reaktoro.

To build them, execute:

~~~
cmake --build build --target examples
~~~

```{admonition} Note for Windows users
If you are using Microsoft Visual Studio, the command above may not work and
you'll need to build the examples by opening the Visual Studio project
generated by CMake in the build directory.
```

You can now run individual C++ examples by executing them:

~~~
build/examples/cpp/ex-equilibrium-fixed-ph
~~~

## Running Reaktoro's Python examples

Reaktoro also contains many examples written in Python that can be found in the
directory
[`examples/python`](https://github.com/reaktoro/reaktoro/tree/main/examples/python)
within the root directory of Reaktoro's source code.

Before we can execute them from the terminal, we need to set the `PYTHONPATH`
environment variable so that the `reaktoro` Python package can be found. From
the root directory, execute:

```{tab} Linux and macOS
~~~
source build/envs
~~~
```
```{tab} Windows
~~~
build\envs4release.bat
~~~
```

This command should output a message indicating the new value of changed
environment variables, such as `PYTHONPATH` and `PATH` (in Windows) or
`LD_LIBRARY_PATH` (in Linux and macOS).

We are now able to execute individual Reaktoro examples written in Python as
follows (ensure you are in the root directory of Reaktoro's source code!):

```{tab} Linux and macOS
~~~
python examples/python/ex-beginner-equilibrium-phreeqc.py
~~~
```
```{tab} Windows
~~~
python examples\python\ex-beginner-equilibrium-phreeqc.py
~~~
```

## Installing Reaktoro after it has been built

You may want to install Reaktoro in a directory of your choice after building
it with `cmake`. You can do so by first specifying where to install:

```{tab} Linux and macOS
~~~
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/home/username/wherever
~~~
```
```{tab} Windows
~~~
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=C:\Users\Username\Wherever
~~~
```

and then executing the `install` target:

```{tab} Linux and macOS
~~~
cmake --build build --target install
~~~
```
```{tab} Windows
~~~
cmake --build build --config Release --target install
~~~
```

This step will install Reaktoro's C++ header files, libraries, executables,
and the Python package `reaktoro` in the specified installation path.

# Please help me installing Reaktoro!

If you are having a hard time installing Reaktoro via `cmake`, please get in
touch via [Gitter][Gitter]. Please make sure you
have already tried investigating the issue before contacting us there, as it
may be just a common `cmake` issue for which a solution already exists!

Also, please make sure this is a new issue before reporting it to us via
[Reaktoro's GitHub Issues](https://github.com/reaktoro/reaktoro/issues/new).
We can chat first about this in [Gitter][Gitter].

[Gitter]: https://gitter.im/reaktoro/community
