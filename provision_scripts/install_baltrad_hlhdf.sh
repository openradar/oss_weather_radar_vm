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

source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/ && \
    $CONDA_DIR/bin/conda install -c conda-forge --yes make

# Below is for Debian 9.2.0 and its conda with Python 3.6
./configure --prefix=/home/vagrant/miniconda/envs/openradar/hlhdf --with-hdf5=/home/vagrant/miniconda/envs/openradar/include,/home/vagrant/miniconda/envs/openradar/lib --enable-py3support --with-py3bin=/home/vagrant/miniconda/envs/openradar/bin/python3 --with-numpy=/home/vagrant/miniconda/envs/openradar/lib/python3.6/site-packages/numpy/core/include/numpy/
make
make test
make install
mv /home/vagrant/miniconda/envs/openradar/hlhdf/hlhdf.pth /home/vagrant/miniconda/envs/openradar/lib/python3.6/site-packages/.

grep -l hlhdf ~/.bashrc
if [ $? == 1 ] ;
then 
echo "export PATH=\"\$PATH:/home/vagrant/miniconda/envs/openradar/hlhdf/bin\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/home/vagrant/miniconda/envs/openradar/lib:/home/vagrant/miniconda/envs/openradar/hlhdf/lib\"" >> ~/.bashrc;
fi
