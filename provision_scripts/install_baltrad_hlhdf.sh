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
# configure hlhdf
# we need to point to the location of the hdf5 headers and binaries
# find out where the headers live on your system with
# $ locate hdf5.h
# for Ubuntu 14.04, the location is /usr/include/
# for Ubuntu 16.04, the location is /usr/include/hdf5/serial (might be different on your system)
#
# and the same for the binaries:
# $ locate libhdf5.a
# $ locate libhdf5.so
# for Ubuntu 14.04, the location is /usr/lib/x86_64-linux-gnu/
# for Ubuntu 16.04, the location is /usr/lib/x86_64-linux-gnu/hdf5/serial/ (might be different on your system)

./configure --prefix=/opt/baltrad/hlhdf --with-hdf5=/usr/include/hdf5/serial,/usr/lib/x86_64-linux-gnu/hdf5/serial
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
