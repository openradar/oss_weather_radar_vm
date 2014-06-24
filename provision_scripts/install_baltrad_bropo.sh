#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad bropo component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# dependencies
sudo apt-get install -qq libpng12-dev
export LD_LIBRARY_PATH=/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib

# install bropo from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/bropo.git
cd bropo/
./configure --prefix=/opt/baltrad/bropo --with-rave=/opt/baltrad/rave
make
make test
make install
# Hack as Ubuntu uses dist-packages for site-packages
sudo echo "/opt/baltrad/bropo/share/brope/pyropo" > pyropo.pth
sudo cp pyropo.pth /usr/lib/python2.7/dist-packages/
echo "export PATH=\"\$PATH:/opt/baltrad/bropo/bin\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/bropo/lib\"" >> ~/.bashrc
