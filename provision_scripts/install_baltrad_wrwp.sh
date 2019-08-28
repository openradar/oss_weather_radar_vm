#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD wrwp from source

# Install system dependencies, not conda in this case
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/hlhdf/lib:$CONDA_PREFIX/rave/lib
sudo apt-get install -qq libatlas-base-dev
sudo apt-get install -qq liblapacke-dev

# HACK some include files are not copied when RAVE is installed
cd ~
if ![[ -d tmp ]]; then
    mkdir tmp
fi
cd tmp

# HACK we need .../rave/tmp to exist
mkdir $CONDA_PREFIX/rave/tmp
chown vagrant:vagrant $CONDA_PREFIX/rave/tmp

# install baltrad_wrwp from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/baltrad-wrwp.git
cd baltrad-wrwp/

source $CONDA_DIR/bin/activate $RADARENV

./configure --prefix=$CONDA_PREFIX/baltrad-wrwp --with-rave=$CONDA_PREFIX/rave --with-blas=/usr/lib --with-cblas=/usr/lib --with-lapack=/usr/lib --with-lapacke=/usr/include,/usr/lib
make
make test
make install

grep -l wrwp ~/.bashrc
if [[ $? == 1 ]]; then
    echo "export PATH=\"\$PATH:$CONDA_PREFIX/baltrad-wrwp/bin\"" >> ~/.bashrc;
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:$CONDA_PREFIX/baltrad-wrwp/lib\"" >> ~/.bashrc;
fi
