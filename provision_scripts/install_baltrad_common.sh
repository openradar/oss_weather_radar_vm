#!/usr/bin/env bash
set -x

# Global BALTRAD setup
##sudo apt-get install -qq git -> moved to install_common.sh
sudo apt-get install -qq python3-dev
sudo apt-get install -qq libpython3.5-dbg
sudo apt-get install -qq python3.5-numpy
sudo apt-get install -qq python3-pip
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
sudo pip3 install matplotlib

sudo mkdir /opt/baltrad
sudo chown vagrant:vagrant /opt/baltrad

# make a site-packages directory for BALTRAD to install into
# see discussion in install_baltrad_finalize.sh for details
sudo mkdir /usr/lib/python2.7/site-packages
sudo chown vagrant:vagrant /usr/lib/python2.7/site-packages
