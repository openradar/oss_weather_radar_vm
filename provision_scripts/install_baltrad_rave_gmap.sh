#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib

# install GoogleMapsPlugin from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
sudo python setup.py install --prefix=/opt/baltrad
