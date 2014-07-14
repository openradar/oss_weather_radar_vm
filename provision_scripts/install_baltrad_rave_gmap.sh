#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD GoogleMapsPlugin component

# dependencies
sudo apt-get install -qq apache2
sudo apt-get install -qq php5
sudo apt-get install -qq libapache2-mod-php5
sudo cp /vagrant/vendor/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/vendor/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# install GoogleMapsPlugin from source
cd ~
cd tmp
git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
python setup.py install --prefix=/opt/baltrad
# HACK the setup.py files need to add the line
# import distutils.sysconfig
# The .pth file is not copied because of this, manually create the file
echo /opt/baltrad/rave_gmap/Lib/ > /usr/lib/python2.7/site-packages/rave_gmap.pth

# Add an amazing case!
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/smhi-areas.xml /opt/baltrad/rave_gmap/web/.
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/products.js /opt/baltrad/rave_gmap/web/.
mkdir /opt/baltrad/rave_gmap/web/data
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/data/eesur_gmaps.tgz /opt/baltrad/rave_gmap/web/data/.
cd /opt/baltrad/rave_gmap/web/data
tar xzf eesur_gmaps.tgz
rm eesur_gmaps.tgz
