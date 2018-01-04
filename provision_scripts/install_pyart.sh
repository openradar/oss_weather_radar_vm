#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Py-ART

# dependencies
sudo apt-get install -qq libfontconfig1
sudo apt-get install -qq gfortran               # for Steiner echo-class
sudo apt-get install -qq python-mpltoolkits.basemap

# Install Py-ART version 1.7.0 from source to system Python
cd ~
mkdir tmp
cd tmp
wget https://github.com/ARM-DOE/pyart/releases/download/v1.8.0/arm_pyart-1.8.0.tar.gz
tar xf arm_pyart-1.8.0.tar.gz
cd arm_pyart-1.8.0/
sudo python setup.py install

# and install to conda env (DOES NOT WORK, YET!)
##source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/ && \
##    python setup.py install
cd ~

# Optional, test the Py-ART install
#sudo apt-get install -qq python-nose xvfb       # testing dependencies
#xvfb-run python -c "import pyart; pyart.test()"
