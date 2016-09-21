#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD RAVE component

# Install RAVE depencies
# Moved installation for some of these dependencies to install_baltrad_bbufr.sh
#sudo apt-get install -qq libproj0
#sudo apt-get install -qq proj-bin
#sudo apt-get install -qq libproj-dev
sudo apt-get install -qq expat
sudo apt-get install -qq libexpat-dev
sudo apt-get install -qq libpython2.7-dbg

export LD_LIBRARY_PATH=/opt/baltrad/hlhdf/lib

# Install RAVE from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/rave.git
cd rave
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_dom_db.py
sed -i -e 's/from keyczar import keyczar/#from keyczar import keyczar/g' Lib/BaltradFrame.py
./configure --prefix=/opt/baltrad/rave --with-hlhdf=/opt/baltrad/hlhdf --with-proj=/usr/include,/usr/lib --with-expat=/usr/include,/lib/x86_64 --with-bufr=/opt/baltrad/bbufr --with-numpy=/usr/lib/python2.7/dist-packages/numpy/core/include/numpy/
make
make test
make install

grep -l rave ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/opt/baltrad/rave/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/rave/lib\"" >> ~/.bashrc;
fi
