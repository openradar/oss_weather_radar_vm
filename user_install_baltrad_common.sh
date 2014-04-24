#!/usr/bin/env bash
set -x

# Global Baltrad setup
sudo apt-get install -qq git
sudo mkdir /opt/baltrad
cd ~
mkdir tmp

echo "export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib" >> ~/.bashrc
