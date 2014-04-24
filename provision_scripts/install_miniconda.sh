#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Miniconda

# install Miniconda
/vagrant/vendor/Miniconda-3.3.0-Linux-x86_64.sh -b
echo "export PATH=\"/home/vagrant/miniconda/bin:\$PATH\"" >> .bashrc
export PATH="/home/vagrant/miniconda/bin:$PATH"
which python

# copy conda packages cached on the host to the guest.
cp /vagrant/vendor/conda_pkgs/* ~/miniconda/pkgs/

# Install core Scientific Python packages and IPython notebook
conda install --yes numpy scipy matplotlib ipython ipython-notebook
