#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD GoogleMapsPlugin component

# dependencies
#sudo apt-get install -qq libfreetype6-dev
sudo apt-get install -qq apache2
sudo apt-get install -qq php
sudo apt-get install -qq libapache2-mod-php
sudo cp /vagrant/vendor/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/vendor/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# install GoogleMapsPlugin from source
cd ~/tmp
git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/
python setup.py install --prefix=/home/vagrant/miniconda/envs/openradar
# Replace Google Maps with OpenStreetMap
cp web/index.html /home/vagrant/miniconda/envs/openradar/rave_gmap/web/.
rm /home/vagrant/miniconda/envs/openradar/rave_gmap/web/index.php

# HACK the setup.py files need to add the line
# import distutils.sysconfig
# The .pth file is not copied because of this, manually create the file
echo /home/vagrant/miniconda/envs/openradar/rave_gmap/Lib/ > /home/vagrant/miniconda/envs/openradar/lib/python3.6/site-packages/rave_gmap.pth

# Add an amazing case!
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/smhi-areas.xml /home/vagrant/miniconda/envs/openradar/rave_gmap/web/.
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/products.js /home/vagrant/miniconda/envs/openradar/rave_gmap/web/.
mkdir /home/vagrant/miniconda/envs/openradar/rave_gmap/web/data
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/data/cawkr_gmaps.tgz /home/vagrant/miniconda/envs/openradar/rave_gmap/web/data/.
cd /home/vagrant/miniconda/envs/openradar/rave_gmap/web/data
tar xzf cawkr_gmaps.tgz
rm cawkr_gmaps.tgz
