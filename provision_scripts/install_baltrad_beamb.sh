#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad beamb component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# install dependencies
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib:/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib

# install beamb from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/beamb.git
cd beamb/
./configure --prefix=/opt/baltrad/beamb --with-rave=/opt/baltrad/rave
make
make test
sudo make install
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/beamb/lib\"" >> ~/.bashrc