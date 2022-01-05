# Installation using Conda

Reaktoro can be easily installed using [Conda](https://conda.io/docs/), a
powerfull package manager used to simplify Reaktoro's installation and the
management of its external software dependencies. Once you install Conda, and
append the necessary channels, you'll be able to install Reaktoro by just
executing the following command in your terminal:

~~~
conda install reaktoro
~~~

Follow the Conda installation steps shown next before you execute this command!

(installing_conda)=
## Installing Conda

Conda can be installed by installing either
[Anaconda](https://www.anaconda.com/download) or
[Miniconda](https://conda.io/miniconda.html). We recommend the installation of
Miniconda, unless you already have Anaconda installed or you think you need
thousands of software packages that ship with it! Miniconda is just a tiny
subset of Anaconda containing only our needed `conda` application and its
dependencies.

Download the appropriate [Miniconda
Installer](https://docs.conda.io/en/latest/miniconda.html) for your system.
You'll be able to choose installers for Windows, macOS, and Linux (32-bit or
64-bit). We recommend the **latest 64-bit Miniconda installer** for your
operating system.

## Adding conda-forge channel

The Reaktoro pre-built package `reaktoro` is hosted on
[conda-forge](https://anaconda.org/conda-forge/reaktoro). After installing
Miniconda, go to a terminal and execute:

~~~
conda config --append channels conda-forge
~~~

to add the conda-forge channel, required so that the Reaktoro package
`reaktoro` can be found.

All should now be set to install Reaktoro using:

~~~
conda install reaktoro
~~~

but you may want to follow the recommendation in the next section to install
Reaktoro in a new conda environment instead of the default `base` environment.

## Install Reaktoro in a new conda environment (optional)

Now that you have `conda` installed, either via Anaconda or Miniconda, you may
want to create a *conda environment* in which the Python package `reaktoro` is
installed together with its dependencies.

This way, you avoid installing `reaktoro` in the `base` conda environment,
which is an environment you should try to keep intact as much as possible.

The command below will create a conda environment named `rkt` and install
`reaktoro` in it, along with all its dependencies.

~~~
conda create --name rkt reaktoro
~~~

After executing the command above, you should get an output similar to the following:

~~~
(base) ~$ conda create --name rkt reaktoro
Collecting package metadata (current_repodata.json): done
Solving environment: done

# Package Plan #

  environment location: /home/allanleal/miniconda3/envs/rkt

  added / updated specs:
    - reaktoro


The following NEW packages will be INSTALLED:

  _libgcc_mutex      conda-forge/linux-64::_libgcc_mutex-0.1-conda_forge
  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-1_gnu
  autodiff           conda-forge/linux-64::autodiff-0.6.4-py39h38e655e_0
  ca-certificates    conda-forge/linux-64::ca-certificates-2021.10.8-ha878542_0
  eigen4rkt          conda-forge/linux-64::eigen4rkt-3.3.904-h4bd325d_0
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.36.1-hea4e1c9_2
  libblas            conda-forge/linux-64::libblas-3.9.0-12_linux64_openblas
  libcblas           conda-forge/linux-64::libcblas-3.9.0-12_linux64_openblas
  libffi             conda-forge/linux-64::libffi-3.4.2-h9c3ff4c_4
  libgcc-ng          conda-forge/linux-64::libgcc-ng-11.2.0-h1d223b6_11
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-11.2.0-h69a702a_11
  libgfortran5       conda-forge/linux-64::libgfortran5-11.2.0-h5c6108e_11
  libgomp            conda-forge/linux-64::libgomp-11.2.0-h1d223b6_11
  liblapack          conda-forge/linux-64::liblapack-3.9.0-12_linux64_openblas
  libopenblas        conda-forge/linux-64::libopenblas-0.3.18-pthreads_h8fe5266_0
  libstdcxx-ng       conda-forge/linux-64::libstdcxx-ng-11.2.0-he4da1e4_11
  libzlib            conda-forge/linux-64::libzlib-1.2.11-h36c2ea0_1013
  ncurses            conda-forge/linux-64::ncurses-6.2-h58526e2_4
  nlohmann_json      conda-forge/linux-64::nlohmann_json-3.10.3-h9c3ff4c_0
  numpy              conda-forge/linux-64::numpy-1.21.3-py39hdbf815f_0
  openssl            conda-forge/linux-64::openssl-3.0.0-h7f98852_1
  optima             conda-forge/linux-64::optima-0.2.3-py39h9da6136_0
  phreeqc4rkt        conda-forge/linux-64::phreeqc4rkt-3.6.2.1-h4bd325d_1
  pip                conda-forge/noarch::pip-21.3.1-pyhd8ed1ab_0
  pugixml            conda-forge/linux-64::pugixml-1.11.4-h9c3ff4c_0
  pybind11-abi       conda-forge/noarch::pybind11-abi-4-hd8ed1ab_3
  python             conda-forge/linux-64::python-3.9.7-hf930737_3_cpython
  python_abi         conda-forge/linux-64::python_abi-3.9-2_cp39
  readline           conda-forge/linux-64::readline-8.1-h46c0cb4_0
  reaktoro           conda-forge/linux-64::reaktoro-2.0.0rc7-py39h9da6136_0
  setuptools         conda-forge/linux-64::setuptools-58.2.0-py39hf3d152e_0
  sqlite             conda-forge/linux-64::sqlite-3.36.0-h9cd32fc_2
  thermofun          conda-forge/linux-64::thermofun-0.3.8-py39hde0f152_0
  tk                 conda-forge/linux-64::tk-8.6.11-h27826a3_1
  tzdata             conda-forge/noarch::tzdata-2021e-he74cb21_0
  wheel              conda-forge/noarch::wheel-0.37.0-pyhd8ed1ab_1
  xz                 conda-forge/linux-64::xz-5.2.5-h516909a_1
  yaml-cpp4rkt       conda-forge/linux-64::yaml-cpp4rkt-0.6.4.2-h4bd325d_2
  zlib               conda-forge/linux-64::zlib-1.2.11-h36c2ea0_1013


Proceed ([y]/n)? y

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate rkt
#
# To deactivate an active environment, use
#
#     $ conda deactivate
~~~

You should now activate the `rkt` environment by executing:

~~~
conda activate rkt
~~~

```{note}
Before running python scripts in which `reaktoro` package is used, ensure the conda environment containing `reaktoro` has been previously activated.
```

```{note}
In the activated `rkt` environment, you can install additional libraries using `conda install` or `pip install`:

~~~
conda install pandas
pip install numba
~~~
```

# Please help me installing Reaktoro!

If you are having a hard time installing Reaktoro via `conda`, please get in
touch via [Gitter](https://gitter.im/reaktoro/community). Please make sure you
have already tried investigating the issue before contacting us there, as it
may be just a common `conda` issue for which a solution already exists!
