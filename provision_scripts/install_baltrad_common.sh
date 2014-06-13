#!/usr/bin/env bash
set -x

# Global Baltrad setup
sudo apt-get install -qq git
sudo apt-get install apache2
sudo mkdir /opt/baltrad
sudo chown vagrant:vagrant /opt/baltrad
sudo cp /vagrant/vendor/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/vendor/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart
cd ~
mkdir tmp
cd tmp

wget --no-check-certificate https://keyczar.googlecode.com/files/keyczar-python-0.71d-09062013.tar.gz
tar xvzf keyczar-python-0.71d-09062013.tar.gz
cd keyczar-python
/home/vagrant/miniconda/bin/python setup.py install

cd ../..
echo "export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib" >> ~/.bashrc
