#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# Install wradlib + runtime dependencies + jupyter notebook
source $CONDA_DIR/bin/activate $RADARENV && \
    conda install --yes wradlib proj4=5.2.0 && \
    conda install --yes jupyter notebook

# Install wradlib course notebooks
cd ~
git clone --depth=1 https://github.com/wradlib/wradlib-notebooks.git

# Install wradlib data
git clone --depth=1 https://github.com/wradlib/wradlib-data.git
echo "export WRADLIB_DATA=~/wradlib-data" >> ~/.profile

conda clean -tipy
