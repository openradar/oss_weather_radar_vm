#!/usr/bin/env bash
set -x

# Vagrant provising script for installing a SciPy stack
sudo apt-get update -qq
sudo apt-get install -qq python-pip python-dev
sudo apt-get install -qq python-numpy python-scipy python-matplotlib cython
sudo apt-get install -qq python-zmq python-jinja2
sudo pip install jupyter
sudo apt-get install -qq libhdf5-dev netcdf-bin libnetcdf-dev 
sudo pip install netcdf4
