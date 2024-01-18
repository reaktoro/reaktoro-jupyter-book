#!/bin/bash

set -e  # exit when any command fails

script_path=$(realpath "$0")
script_dir=$(dirname $script_path)
root_dir=$script_dir/../../
build_dir=$root_dir/_build
html_dir=$build_dir/html

# Needed for the conda activate commands below to work (reference: https://github.com/conda/conda/issues/7980#issuecomment-492784093)
eval "$(conda shell.bash hook)"

# =============================================================================
# Build the Jupyter Book documentation
# =============================================================================
conda activate reaktoro-jupyter-book

# Ensure custom pygment lexers for Python and C++ are installed in the activated conda environment
$root_dir/utils/scripts/replace-pygments-lexers.sh

jupyter-book build $root_dir --all

# =============================================================================
# Build Reaktoro v1 website (documentation + API reference)
# =============================================================================

rm -rf $build_dir/v1
mkdir $build_dir/v1
cd $build_dir/v1

wget https://github.com/reaktoro/reaktoro/archive/refs/heads/v1.zip -O v1.zip
unzip -o -qq v1.zip

cd reaktoro-1

if conda info --envs | grep -q website-reaktoro-v1; then echo "website-reaktoro-v1 conda env already exists!"; else

    sed -i 's/name: reaktoro-v1/name: website-reaktoro-v1/' environment.devenv.yml  # rename the conda environment reaktoro-v1 to website-reaktoro-v1

    conda devenv -m mamba
fi

conda activate website-reaktoro-v1

mkdir build
cd build

cmake ..
make website
mkdir -p $html_dir/v1
cp -r docs/website/* $html_dir/v1

# =============================================================================
# Build Reaktoro v2 API reference
# =============================================================================

rm -rf $build_dir/v2
mkdir $build_dir/v2
cd $build_dir/v2

wget https://github.com/reaktoro/reaktoro/archive/refs/heads/main.zip -O main.zip
unzip -o -qq main.zip

cd reaktoro-main

if conda info --envs | grep -q website-reaktoro-v2; then echo "website-reaktoro-v2 conda env already exists!"; else

    sed -i 's/name: reaktoro/name: website-reaktoro-v2/' environment.devenv.yml  # rename the conda environment reaktoro-v2 to website-reaktoro-v2

    conda devenv -m mamba
fi

conda activate website-reaktoro-v2

mkdir build
cd build

cmake ..
make docs
mkdir -p $html_dir/api
rm -rf $html_dir/api/*
cp -r docs/html/* $html_dir/api
