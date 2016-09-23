#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD GoogleMapsPlugin component

# dependencies
sudo apt-get install -qq libfreetype6-dev
sudo apt-get install -qq apache2
sudo apt-get install -qq php5
sudo apt-get install -qq libapache2-mod-php5
sudo cp /vagrant/vendor/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/vendor/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# Seemingly unnecessary dependency: Imaging 1.1.7
# Because stock pillow in Ubuntu does not support PNG properly.
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
wget --no-check-certificate http://git.baltrad.eu/blt_dependencies/Imaging-1.1.7.tar.gz .
tar xvzf Imaging-1.1.7.tar.gz
cd Imaging-1.1.7
sed -i -e 's/#include <freetype\//#include <freetype2\//g' _imagingft.c
sudo cp /vagrant/vendor/setup.py.Imaging-1.1.7-tweaked setup.py
sudo python setup.py install

# install GoogleMapsPlugin from source
cd ~/tmp
git clone --depth=1 git://git.baltrad.eu/GoogleMapsPlugin.git
cd GoogleMapsPlugin/
python setup.py install --prefix=/opt/baltrad
# HACK the setup.py files need to add the line
# import distutils.sysconfig
# The .pth file is not copied because of this, manually create the file
sudo echo /opt/baltrad/rave_gmap/Lib/ > /usr/lib/python2.7/site-packages/rave_gmap.pth

# Add an amazing case!
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/smhi-areas.xml /opt/baltrad/rave_gmap/web/.
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/products.js /opt/baltrad/rave_gmap/web/.
mkdir /opt/baltrad/rave_gmap/web/data
cp /vagrant/vendor/opt/baltrad/rave_gmap/web/data/cawkr_gmaps.tgz /opt/baltrad/rave_gmap/web/data/.
cd /opt/baltrad/rave_gmap/web/data
tar xzf cawkr_gmaps.tgz
rm cawkr_gmaps.tgz
