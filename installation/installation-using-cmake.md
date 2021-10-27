# Installation using CMake

Reaktoro has several software and library dependencies that need to be
pre-installed for its successful compilation and installation using
[CMake](https://cmake.org/).

To greatly simplify the building process of Reaktoro for Windows, Mac OSX, and
Linux, you'll need [Conda](https://conda.io/docs/). Follow the [Conda
installation steps](#installing-conda) in the previous section, in which a
Miniconda installer is used.

After installing Miniconda, go to a terminal and execute:

~~~ {.sourceCode .}
conda install -n base conda-devenv
~~~

This installs [conda-devenv](https://github.com/ESSS/conda-devenv), a
conda tool with convenient functionalities to define and initialize
conda environments.

## Downloading Reaktoro from GitHub

We need now to download the source code of Reaktoro, which is hosted on
[GitHub](https://github.com/reaktoro/reaktoro). This can be done by
either executing the following [git](https://git-scm.com/) command from
the terminal (if you already have git installed!):

~~~ {.sourceCode .bash}
git clone https://github.com/reaktoro/reaktoro.git
~~~

or by directly downloading
`reaktoro-master.zip<https://github.com/reaktoro/reaktoro/archive/master.zip>`{.interpreted-text
role="download"}, the latest version of Reaktoro's source code in a zip

file.

::: {.note}
::: {.admonition-title}
Note
:::

If you use the direct download option above, please unzip the downloaded
file in a directory of your choice. We assume the unzipped folder is
named `reaktoro` for the next installation steps, and not
`reaktoro-master`.
:::

## Creating a conda environment for Reaktoro

The next step is to create a **conda environment** that contains all the
software and library dependencies needed to build Reaktoro. In the root
of the reaktoro directory, execute:

~~~ {.sourceCode .bash}
conda devenv
~~~

This command will create the conda environment called `reaktoro`, which
can take a few minutes to complete for the first time.

::: {.attention}
::: {.admonition-title}
Attention
:::

You only need to execute `conda devenv` again when the list of external
dependencies changes or some configuration in the conda environment
`reaktoro` is altered.
:::

::: {.note}
::: {.admonition-title}
Note
:::

If you are curious about the list of dependencies needed to build Reaktoro,
have a look at the file `environment.devenv.yml
<../../environment.devenv.yml>`{.interpreted-text role="download"} in the root
directory of Reaktoro's source code. This file is

a *recipe* for the creation of our conda environment `reaktoro` containing all
required dependencies.
:::

## Activating the conda environment for Reaktoro

The next step is to **activate the conda environment** `reaktoro` that
[conda-devenv](https://github.com/ESSS/conda-devenv) created for us:

~~~ {.sourceCode .}
conda activate reaktoro
~~~

::: {.attention}
::: {.admonition-title}
Attention
:::

You need to activate the `reaktoro` conda environment whenever you use Reaktoro
from C++ or Python! This is because conda will adjust some environment
variables in your system (e.g., `PYTHONPATH`, `LD_LIBRARY_PATH`, `PATH`) so
that Reaktoro's libraries, executables, and Python packages can be found.
Activating

the `reaktoro` conda environment is the simplest way to get these environment
variables set correctly.
:::

## Building and installing Reaktoro with CMake

You can now build and install Reaktoro by executing the following from
the root of the reaktoro source directory:

~~~ {.sourceCode .}
cmake -P install
~~~

Assuming the conda environment `reaktoro` is active, this command will
first build Reaktoro and then install its header files, libraries,
executables, Python package in your local *miniconda* directory:
`/home/user/miniconda3/envs/reaktoro/` in Linux, and
`C:\miniconda3\envs\reaktoro\` in Windows.

Alternatively, to build and install Reaktoro in a more traditional way, execute
the following from the root directory of Reaktoro's source

code:

~~~ {.sourceCode .}
mkdir build
cd build
cmake ..
cmake --build . --target install
~~~

The following is also possible with CMake v3.13 or newer:

~~~ {.sourceCode .}
cmake -S . -B build
cmake --build build/ --target install
~~~

::: {.tip}
::: {.admonition-title}
Tip
:::

Compiling the Reaktoro C++ library and the Reaktoro Python module should
take a few minutes for the first time. However, if you activate the
reaktoro conda environment, [ccache](https://ccache.samba.org/) will be
used to significantly speed up future compilations automatically for
you!
:::

## Installing Reaktoro in a custom directory

To install Reaktoro in a different directory, say, `/home/user/other`,
use:

~~~ {.sourceCode .}
cmake -DPREFIX=/home/user/other -P install
~~~

or

~~~ {.sourceCode .bash}
cmake .. -DCMAKE_INSTALL_PREFIX=/home/user/other
cmake --build . --target install
~~~

You'll need, however, to set the

environment variables `PYTHONPATH`, `LD_LIBRARY_PATH`, and `PATH` yourself. For
example, in Linux:

~~~ {.sourceCode .bash}
export PATH=$PATH:/home/user/other/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/other/lib{64}
export PYTHONPATH=$PYTHONPATH:/home/user/other/lib{64}/pythonX.Y/site-packages
~~~

where `lib{64}` is either `lib` or `lib64`, and `pythonX.Y` where `pythonX.Y`
depends on

the python version used to compile Reaktoro's Python package (e.g.,
`python3.6`, `python3.7`).

## Checking for a successful installation

Check if Reaktoro was installed correctly by executing:

~~~ {.sourceCode .bash}
python -c 'import reaktoro; print(reaktoro.__path__[0])'
~~~

This should print the path to the installed python package `reaktoro`.
For example:

~~~ {.sourceCode .bash}
/home/user/miniconda3/envs/reaktoro/lib/pythonX.Y/site-packages/reaktoro
~~~

where `pythonX.Y` above depends on the python version used.

::: {.attention}
::: {.admonition-title}
Attention
:::

Make sure you have the conda environment `reaktoro` active! Otherwise
the checking above might not work without further actions (e.g.,
changing the `PYTHONPATH` environment variable).
:::

If you get instead something like:

~~~ {.sourceCode .bash}
Traceback (most recent call last):
    File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'reaktoro'
~~~

then the installation was not successful or it was installed in a custom
path that is not yet given in the `PYTHONPATH` environment variable.
