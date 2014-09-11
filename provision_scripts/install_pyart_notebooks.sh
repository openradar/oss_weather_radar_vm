#!/usr/bin/env bash
#This script clones the pyart course to the VM and runs a script
#to grab data
set -x
# Get the Py-ART notebooks from GitHub
cd ~
#install git just in case
sudo apt-get install -qq git
git clone https://github.com/openradar/pyart_short_course
#get data
cd pyart_short_course/data
./get_data.sh
