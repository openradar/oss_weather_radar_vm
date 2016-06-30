#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# Install wradlib depencies
sudo pip install numpy 
sudo apt-get install -qq libfontconfig1 python-gdal python-h5py
sudo pip install xmltodict

# Install wradlib from source
cd ~
mkdir tmp
cd tmp
sudo apt-get install -qq unzip
# Install wradlib
wget --no-check-certificate https://github.com/wradlib/wradlib/archive/master.zip
unzip master.zip
cd wradlib-master
sudo python setup.py install
# copy course notebooks from wradlib distribution
cp -r notebooks/ ~/wradlib_course/ 
cd ~
sudo rm -r tmp
# Install wradlib data
wget --no-check-certificate https://github.com/wradlib/wradlib-data/archive/master.zip
unzip master.zip
rm master.zip
# Set environemtn variables
echo "export WRADLIB_DATA=~/wradlib-data-master" >> ~/.profile
echo "export GDAL_DATA=/usr/share/gdal/1.10/" >> ~/.profile
 
