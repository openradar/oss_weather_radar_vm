#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad hlhdf component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# Install hlhdf depencies
conda install --yes hdf5
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib

# Install hlhdf from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/hlhdf.git
cd hlhdf/
./configure --prefix=/opt/baltrad/hlhdf --with-hdf5=/home/vagrant/miniconda/include,/home/vagrant/miniconda/lib
make
make test
make install
echo "export PATH=\"\$PATH:/opt/baltrad/hlhdf/bin\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/hlhdf/lib\"" >> ~/.bashrc

# HACK, I believe this should be done during make install
cp /opt/baltrad/hlhdf/hlhdf.pth ~/miniconda/lib/python2.7/site-packages/
