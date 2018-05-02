#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Py-ART

# dependencies
##sudo apt-get install -qq libfontconfig1 --> moved to install_common.sh 
##sudo apt-get install -qq gfortran               # for Steiner echo-class --> moved to install_common.sh
sudo apt-get install -qq python-mpltoolkits.basemap

# Install Py-ART version 1.9.0 from source to system Python
cd ~
mkdir tmp
cd tmp
wget https://github.com/ARM-DOE/pyart/releases/download/v1.9.0-picasso/arm_pyart-1.9.0.tar.gz
tar xf arm_pyart-1.9.0.tar.gz
cd arm_pyart-1.9.0/
sudo python setup.py install

# and install to conda env
source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/ && \
    $CONDA_DIR/bin/conda install trmm_rsl cartopy --yes && \
    $CONDA_DIR/bin/conda install arm_pyart --no-deps --yes
cd ~

# Optional, test the Py-ART install
#sudo apt-get install -qq python-nose xvfb       # testing dependencies
#xvfb-run python -c "import pyart; pyart.test()"
