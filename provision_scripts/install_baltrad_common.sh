#!/usr/bin/env bash
set -x

# Global BALTRAD setup
sudo apt-get install -qq git
sudo mkdir /opt/baltrad
sudo chown vagrant:vagrant /opt/baltrad

#sudo pip install jprops

# make a site-packages directory for BALTRAD to install into
# see discussion in install_baltrad_finalize.sh for details
sudo mkdir /usr/lib/python2.7/site-packages
sudo chown vagrant:vagrant /usr/lib/python2.7/site-packages

# cd ~
# if ! [ -d tmp ]; then
# mkdir tmp
# fi
# cd tmp
# wget --no-check-certificate https://github.com/google/keyczar/archive/master.zip
# unzip master.zip
# cd keyczar-master/python
# sudo python setup.py install

# cd ~
