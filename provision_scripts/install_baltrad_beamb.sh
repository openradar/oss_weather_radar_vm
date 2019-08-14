#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD beamb component

# install dependencies
export LD_LIBRARY_PATH=/home/vagrant/miniconda/envs/openradar/lib:/home/vagrant/miniconda/envs/openradar/hlhdf/lib:/home/vagrant/miniconda/envs/openradar/rave/lib

# install beamb from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/beamb.git
cd beamb/

source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/

./configure --prefix=/home/vagrant/miniconda/envs/openradar/beamb --with-rave=/home/vagrant/miniconda/envs/openradar/rave
make
make test
make install
echo /home/vagrant/miniconda/envs/openradar/beamb/share/beamb/pybeamb > /home/vagrant/miniconda/lib/python3.6/site-packages/beamb.pth

grep -l beamb ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/home/vagrant/miniconda/envs/openradar/beamb/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/home/vagrant/miniconda/envs/openradar/beamb/lib\"" >> ~/.bashrc;
fi
grep -l beamb /home/vagrant/miniconda/envs/openradar/rave/etc/rave_pgf_quality_registry.xml
if [ $? == 1 ] ;
then 
sed -i 's/<\/rave-pgf-quality-registry>/  <quality-plugin name="beamb" module="beamb_quality_plugin" class="beamb_quality_plugin"\/>\n<\/rave-pgf-quality-registry>/g' /home/vagrant/miniconda/envs/openradar/rave/etc/rave_pgf_quality_registry.xml;
fi
