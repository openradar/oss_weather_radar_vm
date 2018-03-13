#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# Install wradlib runtime dependencies
source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/ && \
    $CONDA_DIR/bin/conda install -c conda-forge --yes gdal numpy scipy matplotlib netcdf4 h5py xmltodict notebook

# Install wradlib
cd ~
mkdir tmp
cd tmp
git clone --depth=1 https://github.com/wradlib/wradlib.git
cd wradlib
source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/ && \  
    python setup.py install
    
# Install wradlib course notebooks
cd ~
mkdir wradlib_short_course
cp -a tmp/wradlib/notebooks/ ~/wradlib_short_course/

# Install wradlib data
git clone --depth=1 https://github.com/wradlib/wradlib-data.git
echo "export WRADLIB_DATA=~/wradlib-data" >> ~/.profile

conda clean -tipy
