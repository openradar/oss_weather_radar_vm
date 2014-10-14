#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD bropo component

# dependencies
sudo apt-get install -qq libpng12-dev
export LD_LIBRARY_PATH=/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib

# install bropo from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth 1 git://git.baltrad.eu/bropo.git
cd bropo/
./configure --prefix=/opt/baltrad/bropo --with-rave=/opt/baltrad/rave
make
make test
make install

grep -l bropo ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/opt/baltrad/bropo/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/bropo/lib\"" >> ~/.bashrc;
fi
grep -l ropo /opt/baltrad/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="ropo" module="ropo_quality_plugin" class="ropo_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' /opt/baltrad/rave/etc/rave_pgf_quality_registry.xml;
fi
