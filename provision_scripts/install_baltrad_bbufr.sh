#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad bufr component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# install dependencies
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib
export CPPFLAGS="-I/home/vagrant/miniconda/include"
export LDFLAGS="-L/home/vagrant/miniconda/lib"

# install bbufr from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/bbufr.git
cd bbufr/
./configure --prefix=/opt/baltrad/bbufr
make
make install
