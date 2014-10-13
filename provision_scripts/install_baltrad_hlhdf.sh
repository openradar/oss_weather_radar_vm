#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD HL-HDF component

# Install hlhdf depencies

# Install hlhdf from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/hlhdf.git
cd hlhdf/
./configure --prefix=/opt/baltrad/hlhdf 
make
make test
make install

grep -l hlhdf ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/opt/baltrad/hlhdf/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/hlhdf/lib\"" >> ~/.bashrc;
fi

# HACK, I believe this should be done during make install
sudo cp /opt/baltrad/hlhdf/hlhdf.pth /usr/lib/python2.7/dist-packages/
