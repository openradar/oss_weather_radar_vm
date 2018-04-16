#!/usr/bin/env bash

# This updates wradlib itself and the course notebooks (not wradlib-data!)
set -x

cd ~
mkdir tmp
cd tmp
git clone https://github.com/wradlib/wradlib.git
cd wradlib
sudo python setup.py install

# Install wradlib course notebooks
cd ~
sudo rm -rf wradlib-notebooks
git clone --depth=1 https://github.com/wradlib/wradlib-notebooks.git

sudo rm -rf tmp
