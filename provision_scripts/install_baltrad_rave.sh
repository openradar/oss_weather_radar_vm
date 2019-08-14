#!/usr/bin/env bash
set -x

# Vagrant provision script for installing BALTRAD RAVE component

# Install RAVE depencies
# Moved installation for some of these dependencies to install_baltrad_bbufr.sh
#sudo apt-get install -qq libproj0
sudo apt-get install -qq proj-bin
sudo apt-get install -qq libproj-dev
#sudo apt-get install -qq expat
#sudo apt-get install -qq libexpat-dev

export LD_LIBRARY_PATH=/home/vagrant/miniconda/envs/openradar/hlhdf/lib

# Install RAVE from source
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 git://git.baltrad.eu/rave-py3.git
cd rave-py3
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_dom_db.py
sed -i -e 's/import jprops/#import jprops/g' Lib/rave_bdb.py
sed -i -e 's/from baltrad.bdbclient/#from baltrad.bdbclient/g' Lib/rave_bdb.py
sed -i -e 's/from keyczar import keyczar/#from keyczar import keyczar/g' Lib/BaltradFrame.py
cp -p /vagrant/vendor/fix_shebang.sh bin/.  # Copies in path to Python for conda

source $CONDA_DIR/bin/activate $CONDA_DIR/envs/$RADARENV/

./configure --prefix=/home/vagrant/miniconda/envs/openradar/rave --with-hlhdf=/home/vagrant/miniconda/envs/openradar/hlhdf --with-proj=/usr/include,/usr/lib/x86_64-linux-gnu --with-expat=/home/vagrant/miniconda/envs/openradar/include,/home/vagrant/miniconda/envs/openradar/lib --with-numpy=/home/vagrant/miniconda/envs/openradar/lib/python3.6/site-packages/numpy/core/include/numpy/ --with-netcdf=/home/vagrant/miniconda/envs/openradar/include,/home/vagrant/miniconda/envs/openradar/lib --enable-py3support --with-py3bin=/home/vagrant/miniconda/envs/openradar/bin/python --with-py3bin-config=/home/vagrant/miniconda/envs/openradar/bin/python3-config --with-python-makefile=/home/vagrant/miniconda/envs/openradar/lib/python3.6/config-3.6m-x86_64-linux-gnu/Makefile
make
make test
make install
# Copy files that need special (temporary) monkeying to transition to Py3
cp -r /vagrant/vendor/opt/baltrad/rave/Lib/* /home/vagrant/miniconda/envs/openradar/rave/Lib/

grep -l rave ~/.bashrc
if [ $? == 1 ] ;
then
echo "export RAVEROOT=/home/vagrant/miniconda/envs/openradar" >> ~/.bashrc
echo "export PATH=\"\$PATH:/home/vagrant/miniconda/envs/openradar/rave/bin\"" >> ~/.bashrc;
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/home/vagrant/miniconda/envs/openradar/rave/lib\"" >> ~/.bashrc;
fi
