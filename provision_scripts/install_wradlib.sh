#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# Install and activate wradlib conda environment
#    (first line is a tweak since the --force option 
#     in conda create" appears not to work)
conda env remove --name wradlib --yes || echo "environment wradlib does not yet exist"
conda create --name wradlib python=3.6 --yes
source activate wradlib

# Install wradlib runtime dependencies
source activate wradlib && \
    conda install -c conda-forge --yes gdal numpy scipy matplotlib netcdf4 h5py xmltodict notebook

# Install wradlib from source
##source activate wradlib && \    
##    pip install https://github.com/wradlib/wradlib/archive/master.zip

# Install wradlib
cd ~
mkdir tmp
cd tmp
git clone --depth=1 https://github.com/wradlib/wradlib.git
cd wradlib
source activate wradlib && \  
    python setup.py install
##echo "export GDAL_DATA=/usr/share/gdal/1.10/" >> ~/.profile
cd ~
mkdir wradlib_short_course
cp -a tmp/wradlib/notebooks/ ~/wradlib_short_course/

# Install wradlib data
git clone --depth=1 https://github.com/wradlib/wradlib-data.git
echo "export WRADLIB_DATA=~/wradlib-data" >> ~/.profile

conda clean -tipy

# Install wradlib depencies
##sudo pip install numpy 
##sudo apt-get install -qq libfontconfig1 python-gdal python-h5py
##sudo pip install xmltodict


# Install wradlib
##cd ~
##mkdir tmp
##cd tmp
##git clone --depth=1 https://github.com/wradlib/wradlib.git
##cd wradlib
##sudo python setup.py install
##echo "export GDAL_DATA=/usr/share/gdal/1.10/" >> ~/.profile
##cd ~
##mkdir wradlib_short_course
##cp -a tmp/wradlib/notebooks/ ~/wradlib_short_course/

# Install wradlib data
##git clone --depth=1 https://github.com/wradlib/wradlib-data.git
##echo "export WRADLIB_DATA=~/wradlib-data" >> ~/.profile
