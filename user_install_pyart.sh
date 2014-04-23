#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Py-ART
export PATH="/home/vagrant/miniconda/bin:$PATH"

# Install Py-ART using from conda packages
sudo apt-get install -qq libfontconfig1
conda install --yes -c jjhelmus pyart
conda install --yes nose
conda install --yes basemap

# copy script which runs unit tests
cp /vagrant/vendor/test_pyart.sh ~/
