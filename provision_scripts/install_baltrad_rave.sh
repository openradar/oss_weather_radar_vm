#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad rave component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# Install rave depencies
sudo apt-get install -qq libproj0
sudo apt-get install -qq proj-bin
sudo apt-get install -qq libproj-dev
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib:/opt/baltrad/hlhdf/lib

# Install rave from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/rave.git
cd rave
./configure --prefix=/opt/baltrad/rave --with-hlhdf=/opt/baltrad/hlhdf
make
make test
sudo make install
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/rave/lib\"" >> ~/.bashrc
