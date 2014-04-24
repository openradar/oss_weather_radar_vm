#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib
export PATH="/home/vagrant/miniconda/bin:$PATH"

# dependencies
conda install --yes PIL

# install GoogleMapsPlugin from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
sudo python setup.py install --prefix=/opt/baltrad

# HACK the setup.py files need to add the line
# import distutils.sysconfig
# The .pth file is not copied because of this, manually create the file
echo /opt/baltrad/rave_gmap/Lib/ > ~/miniconda/lib/python2.7/site-packages/rave_gmap.pth
