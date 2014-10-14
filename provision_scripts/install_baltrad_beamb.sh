#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD beamb component

# install dependencies
export LD_LIBRARY_PATH=/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib

# install beamb from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/beamb.git
cd beamb/
./configure --prefix=/opt/baltrad/beamb --with-rave=/opt/baltrad/rave
make
make test
make install

grep -l beamb ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/opt/baltrad/beamb/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/beamb/lib\"" >> ~/.bashrc;
fi
grep -l beamb /opt/baltrad/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then 
sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="beamb" module="beamb_quality_plugin" class="beamb_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' /opt/baltrad/rave/etc/rave_pgf_quality_registry.xml;
fi
