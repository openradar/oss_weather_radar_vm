#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# Install wradlib depencies 
sudo apt-get install -qq libfontconfig1 python-numpydoc python-gdal python-h5py
sudo pip install xmltodict
sudo pip install importlib

# Install wradlib from source
cd ~
mkdir tmp
cd tmp
sudo apt-get install -qq unzip
wget --no-check-certificate http://bitbucket.org/wradlib/wradlib/get/default.zip
unzip default.zip
cd wradlib-wradlib*
sudo python setup.py install
cd ~
sudo rm -r tmp
