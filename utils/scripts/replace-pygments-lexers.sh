#!/bin/bash

script_path=$(realpath "$0")
script_dir=$(dirname $script_path)

pygments_init_file=$(python -c "import pygments; print(pygments.__file__)")
pygments_dir=$(dirname $pygments_init_file)

echo $script_path
echo $pygments_dir

cp $pygments_dir/lexers/python.py $pygments_dir/lexers/python-bkp.py
cp $pygments_dir/lexers/c_cpp.py $pygments_dir/lexers/c_cpp-bkp.py

cp $script_dir/../lexers/python.py $pygments_dir/lexers
cp $script_dir/../lexers/c_cpp.py $pygments_dir/lexers
