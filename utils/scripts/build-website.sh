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
mkdir build
cd build

conda activate reaktoro-v1
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
mkdir build
cd build

conda activate reaktoro
cmake ..
make docs
mkdir -p $html_dir/api
rm -rf $html_dir/api/*
cp -r docs/html/* $html_dir/api
