#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD BUFR component

# install dependencies
sudo apt-get install -qq libproj0
sudo apt-get install -qq proj-bin
sudo apt-get install -qq libproj-dev

# install bbufr from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/bbufr.git
cd bbufr/
./configure --prefix=/opt/baltrad/bbufr
make
make install
