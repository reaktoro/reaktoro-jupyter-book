# Development

Here we provide tips in case you want to help with Reaktoro development.
Reaktoro is primarily developed using [Visual Studio Code][vscode] on Linux. If you are on Windows, consider using the *Windows Subsystem for Linux (WSL) with Ubuntu* by following these [installation instructions][wsl-ubuntu] provided by Canonical<sup>®</sup>.

## Installing recommended extensions for Visual Studio Code

After installing Visual Studio Code, make sure you also install some important extensions:

* [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)
* [Python Extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* [CMake Language Support](https://marketplace.visualstudio.com/items?itemName=josetr.cmake-language-support-vscode)
* [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)

Try to discover more interesting extensions and get to know the ones above!

## Launching Visual Studio Code

If you are developing Reaktoro, you should use [conda] as a package and dependency manager. The entire process of installing conda and creating a conda environment called `reaktoro` containing all Reaktoro dependencies can be found in the [Installation using CMake](../installation/installation-using-cmake) instructions.

To ensure that Visual Studio Code works correctly with the `reaktoro` conda environment, it is recommended to launch it from the terminal with the `reaktoro` environment activated. In a terminal, go to the directory where the Reaktoro source code was git cloned, activate the `reaktoro` conda environment and launch Visual Studio Code using `code .`. See the complete sequence of commands below:

~~~text
cd path/to/reaktoro
conda activate reaktoro
code .
~~~

```{note}
By launching Visual Studio Code in this way, it will be aware of the environment variables present when the conda environemt `reaktoro` is activated, and this will help with both IntelliSense, debugging, and executing Python scripts using Reaktoro.
```

## Ensuring IntelliSense works correctly

Unfortunately, Visual Studio Code doesn't automatically detect where all of Reaktoro's C++ dependencies are located, and you might get error squiggles all over the place because it can't find header files for those dependencies. To fix this, you should press `Ctrl+Shift+P` and select `C/C++: Edit Configurations (JSON)`. In the created C/C++ configuration file, consider:

~~~json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "${workspaceFolder}/",
                "${env:CONDA_PREFIX}/**"
            ],
            "defines": [
                "AUTODIFF_ENABLE_IMPLICIT_CONVERSION_REAL=1",
                "REAKTORO_EMBEDDED_DIR=${workspaceFolder}/embedded",
                "REAKTORO_DATABASES_DIR=${workspaceFolder}/embedded/databases",
                "REAKTORO_PARAMS_DIR=${workspaceFolder}/embedded/params"
            ],
            "compilerPath": "${env:CXX}",
            "cStandard": "c17",
            "cppStandard": "c++17",
            "intelliSenseMode": "linux-gcc-x64",
            "compileCommands": "${workspaceFolder}/compile_commands.json"
        }
    ],
    "version": 4
}
~~~

This configuration is telling Visual Studio Code to find header files under `${env:CONDA_PREFIX}`, which resolves to `/home/username/miniconda3/envs/reaktoro`. It also tells Visual Studio Code to use the C++ compiler available in the conda environment, `${env:CXX}`, instead of the default compiler available on the system.

```{note}
This is one of the reasons why it's important to launch Visual Studio Code from the terminal with the `reaktoro` environment enabled. By doing so, it knows the `CONDA_PREFIX` and `CXX` environment variables used in the above configuration.
```

## Creating compilation tasks for Reaktoro

If you are looking for `Ctrl+Shift+B` to trigger a Reaktoro build from within Visual Studio Code, then you need a *build task*. Press `Ctrl+Shift+P` and select `Tasks: Configure Default Build Tasks`, then select `Create tasks.json file from template` and select `Others`. Replace the contents of the created `tasks.json` file with:

~~~json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "clear && make -j",
            "options": {
                "cwd": "${workspaceFolder}/build/debug/gcc"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": [
                "$gcc"
            ]
        },
        {
            "label": "Build & Test",
            "type": "shell",
            "command": "clear && make -j tests",
            "options": {
                "cwd": "${workspaceFolder}/build/debug/gcc"
            },
            "problemMatcher": [
                "$gcc"
            ]
        }
    ]
}
~~~

The configuration above assumes that you have created a ` build/debug/gcc` directory and executed `cmake ../../.. -DCMAKE_BUILD_TYPE=Debug` from inside of it:

~~~text
mkdir -p build/debug/gcc
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug
~~~

```{tip}
Consider using the [LLVM linker `lld`](https://lld.llvm.org/), which is faster than the default [GNU linker `ld`](https://linux.die.net/man/1/ld), when configuring the build of Reaktoro (for either debug or release modes):

~~~bash
cmake ../../.. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fuse-ld=lld"
~~~
```

## Creating run tasks for Reaktoro's tests and examples



[vscode]: https://code.visualstudio.com/
[wsl-ubuntu]: https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#1-overview
[conda]: https://docs.conda.io/en/latest/

[vscode-tasks]: https://github.com/reaktoro/reaktoro/blob/main/utilities/vscode-utils/.vscode-template/tasks.json
[vscode-launch]: https://github.com/reaktoro/reaktoro/blob/main/utilities/vscode-utils/.vscode-template/launch.json
[vscode-c_cpp_properties]: https://github.com/reaktoro/reaktoro/blob/main/utilities/vscode-utils/.vscode-template/c_cpp_properties.json
