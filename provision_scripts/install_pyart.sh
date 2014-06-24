#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Py-ART

# dependencies
sudo apt-get install -qq libfontconfig1 git 
sudo apt-get install -qq gfortran               # for Steiner echo-class
sudo apt-get install -qq python-mpltoolkits.basemap
sudo apt-get install -qq python-nose xvfb       # testing dependencies

# Install TRMM RSL from source
sudo apt-get install -qq flex
cd ~
mkdir tmp
cd tmp
wget ftp://trmm-fc.gsfc.nasa.gov/software/rsl-v1.44.tar.gz -O rsl-v1.44.tar.gz
tar xfz rsl-v1.44.tar.gz
cd rsl-v1.44/
./configure
make
sudo make install

# Cbc and CyLP
cd ~
mkdir tmp
cd tmp
wget http://www.coin-or.org/download/source/Cbc/Cbc-2.8.8.tgz -O Cbc-2.8.8.tgz
tar xfz Cbc-2.8.8.tgz
cd Cbc-2.8.8/
./configure --prefix=/opt/cbc
make
#make tests  # takes a long time, skip
sudo make
sudo mkdir /opt/cbc
sudo make install

export COIN_INSTALL_DIR=/opt/cbc
pip install --user cylp
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/cbc/lib\"" >> ~/.bashrc

# Install Py-ART from source
cd ~
mkdir tmp
cd tmp
#git clone --depth=1 https://github.com/jjhelmus/pyart.git
git clone --depth=1 https://github.com/ARM-DOE/pyart.git
cd pyart
sudo python setup.py install
