#!/usr/bin/env bash
set -x
# Vagrant provision script for installing Radx
VERSION=20160809

##############################################################################
# Install from source
# requires libnetcdf-c++4-dev which is not available in Ubuntu 14.04
##############################################################################
# This script installs as many dependencies using the system packages as
# possible. In addition no packages are expected to be installed prior to
# running this script
# Set version here
# see available versions here: https://www.eol.ucar.edu/software/radx
# Install Radx depencies
# see http://www.ral.ucar.edu/projects/titan/docs/radial_formats/README
# gcc installed on the base VM

#sudo apt-get install -qq g++
#sudo apt-get install -qq libhdf5-dev netcdf-bin libnetcdf-dev
#sudo apt-get install -qq libudunits2-dev
#sudo apt-get install -qq libbz2-dev
#sudo apt-get install -qq libfftw3-dev
## UNKNOWN
## Install Radx from source
#cd ~
#mkdir tmp
#cd tmp
#wget -q https://www.eol.ucar.edu/system/files/software/radx/all-oss/radx-$VERSION.src_.tgz -O radx-$VERSION.src_.tgz
#tar xfz radx-$VERSION.src_.tgz
#rm radx-$VERSION.src_.tgz
#cd radx-$VERSION.src
## build Radx
#chmod +x build_radx
#sudo ./build_radx /usr/local

##############################################################################
# Install from binaries
##############################################################################
cd ~
mkdir tmp
cd tmp
wget -q https://www.eol.ucar.edu/system/files/software/radx/64-bit-binary/radx-$VERSION.x86_64.tgz -O radx-$VERSION.x86_64.tgz
tar xfz radx-$VERSION.x86_64.tgz
rm radx-$VERSION.x86_64.tgz
cd radx-$VERSION.x86_64
sudo ./install_bin_release /usr/local
