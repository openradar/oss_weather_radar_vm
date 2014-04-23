#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib
export PATH="/home/vagrant/miniconda/bin:$PATH"

# Global Baltrad setup
sudo apt-get install -qq git
sudo mkdir /opt/baltrad

# Install hlhdf depencies
conda install --yes hdf5
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib   # HACK

# Install hlhdf from source
cd ~
mkdir tmp
cd tmp
git clone --depth=1 git://git.baltrad.eu/hlhdf.git
cd hlhdf/
./configure --prefix=/opt/baltrad/hlhdf --with-hdf5=/home/vagrant/miniconda/include,/home/vagrant/miniconda/lib
make
make test
sudo make install


# Install rave depencies
sudo apt-get install -qq libproj0
sudo apt-get install -qq proj-bin
sudo apt-get install -qq libproj-dev

# Install rave from source
cd ~
mkdir tmp
cd tmp
git clone --depth=1 git://git.baltrad.eu/rave.git
cd rave
./configure --prefix=/opt/baltrad/rave --with-hlhdf=/opt/baltrad/hlhdf
make
make test
sudo make install

# clean up
#cd ~
#rm -r tmp
