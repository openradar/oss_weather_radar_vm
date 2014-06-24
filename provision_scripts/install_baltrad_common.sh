#!/usr/bin/env bash
set -x

# Global Baltrad setup
sudo apt-get install -qq git
sudo mkdir /opt/baltrad
sudo chown vagrant:vagrant /opt/baltrad
cd ~
mkdir tmp
cd tmp

wget --no-check-certificate https://keyczar.googlecode.com/files/keyczar-python-0.71d-09062013.tar.gz
tar xzf keyczar-python-0.71d-09062013.tar.gz
cd keyczar-python
sudo python setup.py install

cd ../..
