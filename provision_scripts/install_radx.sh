#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Radx

# Set version here
#   see available versions here: https://www.eol.ucar.edu/software/radx
VERSION=20141125


# Install Radx depencies
# see http://www.ral.ucar.edu/projects/titan/docs/radial_formats/README

##gcc 4.3+ compiler --> already aboard the VM
##g++ 4.3+ compiler --> already aboard the VM
##gfortran compiler --> already aboard the VM

sudo apt-get install -qq tcsh
##perl shell --> already aboard the VM

# for fftw3-devel
sudo apt-get install -qq libfftw3-dev
#for  bzip2-devel
sudo apt-get install -qq libbz2-dev
# for zlib-devel
sudo apt-get install -qq zlib1g-dev
# for expat-devel
sudo apt-get install -qq expat

# Install Radx from source
cd ~
mkdir tmp
cd tmp
wget https://www.eol.ucar.edu/system/files/software/radx/all-oss/radx-$VERSION.src_.tgz -O radx-$VERSION.src_.tgz

tar xfz radx-$VERSION.src_.tgz

rm radx-$VERSION.src_.tgz 

cd radx-$VERSION.src

# build HDF5, NetCDF and udunits2
chmod +x build_netcdf
sudo ./build_netcdf

# build Radx
chmod +x build_radx
sudo ./build_radx /usr/local
