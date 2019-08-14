#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD bropo component

# dependencies
#sudo apt-get install -qq libpng-dev
export LD_LIBRARY_PATH=/home/vagrant/miniconda/envs/openradar/lib:/home/vagrant/miniconda/envs/openradar/hlhdf/lib:/home/vagrant/miniconda/envs/openradar/rave/lib

# install bropo from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth 1 git://git.baltrad.eu/bropo.git
cd bropo/

source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/

./configure --prefix=/home/vagrant/miniconda/envs/openradar/bropo --with-rave=/home/vagrant/miniconda/envs/openradar/rave --with-png=/home/vagrant/miniconda/envs/openradar
make
make test
make install

grep -l bropo ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/home/vagrant/miniconda/envs/openradar/bropo/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/home/vagrant/miniconda/envs/openradar/bropo/lib\"" >> ~/.bashrc;
fi
grep -l ropo_quality_plugin /home/vagrant/miniconda/envs/openradar/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="ropo" module="ropo_quality_plugin" class="ropo_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' /home/vagrant/miniconda/envs/openradar/rave/etc/rave_pgf_quality_registry.xml;
fi
