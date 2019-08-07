#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source

# install dependencies
export LD_LIBRARY_PATH=/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib
sudo apt-get install -qq libatlas-base-dev
sudo apt-get install -qq liblapacke-dev

# HACK some include files are not copied when RAVE is installed
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
cd rave
sudo cp librave/toolbox/*.h /opt/baltrad/rave/include/

# HACK we need .../rave/tmp to exist
sudo mkdir /opt/baltrad/rave/tmp
sudo chown vagrant:vagrant /opt/baltrad/rave/tmp

# install baltrad_wrwp from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/baltrad-wrwp.git
cd baltrad-wrwp/
./configure --prefix=/opt/baltrad/baltrad-wrwp --with-rave=/opt/baltrad/rave --with-blas=/usr/lib --with-cblas=/usr/lib --with-lapack=/usr/lib --with-lapacke=/usr/include,/usr/lib
make
make test
sudo make install

grep -l wrwp ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/opt/baltrad/baltrad-wrwp/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/baltrad-wrwp/lib\"" >> ~/.bashrc;
fi
echo /opt/baltrad/baltrad-wrwp/share/wrwp/pywrwp/ > baltrad_wrwp.pth
sudo mv baltrad_wrwp.pth /usr/lib/python3/dist-packages/baltrad_wrwp.pth
