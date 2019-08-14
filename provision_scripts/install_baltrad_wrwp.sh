#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source

# Install system dependencies, not conda in this case
export LD_LIBRARY_PATH=/home/vagrant/miniconda/envs/openradar/lib:/home/vagrant/miniconda/envs/openradar/hlhdf/lib:/home/vagrant/miniconda/envs/openradar/rave/lib
sudo apt-get install -qq libatlas-base-dev
sudo apt-get install -qq liblapacke-dev

# HACK some include files are not copied when RAVE is installed
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp

# HACK we need .../rave/tmp to exist
mkdir /home/vagrant/miniconda/envs/openradar/rave/tmp
chown vagrant:vagrant /home/vagrant/miniconda/envs/openradar/rave/tmp

# install baltrad_wrwp from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/baltrad-wrwp.git
cd baltrad-wrwp/

source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/

./configure --prefix=/home/vagrant/miniconda/envs/openradar/baltrad-wrwp --with-rave=/home/vagrant/miniconda/envs/openradar/rave --with-blas=/usr/lib --with-cblas=/usr/lib --with-lapack=/usr/lib --with-lapacke=/usr/include,/usr/lib
make
make test
make install

grep -l wrwp ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/home/vagrant/miniconda/envs/openradar/baltrad-wrwp/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/home/vagrant/miniconda/envs/openradar/baltrad-wrwp/lib\"" >> ~/.bashrc;
fi
