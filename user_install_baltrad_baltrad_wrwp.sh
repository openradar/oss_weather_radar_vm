#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad baltrad_wrwp from source
export PATH="/home/vagrant/miniconda/bin:$PATH"

# install dependencies
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib:/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib
sudo apt-get install -qq libatlas-base-dev
sudo apt-get install -qq liblapacke-dev

# HACK some include files are not copied when rave is installed
cd ~
cd tmp
cd rave
sudo cp librave/toolbox/*.h /opt/baltrad/rave/include/

# HACK we need .../rave/tmp to exist
sudo mkdir /opt/baltrad/rave/tmp

# install baltrad_wrwp from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/baltrad-wrwp.git
cd baltrad-wrwp/
./configure --prefix=/opt/baltrad/baltrad-wrwp --with-rave=/opt/baltrad/rave --with-blas=/usr/lib/atlas-base/atlas
make
make test
sudo make install
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/baltrad-wrwp/lib\"" >> ~/.bashrc
echo /opt/baltrad/baltrad-wrwp/share/wrwp/pywrwp/ > ~/miniconda/lib/python2.7/site-packages/baltrad_wrwp.pth
