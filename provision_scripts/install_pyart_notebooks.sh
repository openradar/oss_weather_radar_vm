#!/usr/bin/env bash
# This script clones the pyart course to the VM and runs a script
# to grab data.
set -x
# Get the Py-ART notebooks from GitHub.
cd ~
# Install git and zip/unzip just in case.
sudo apt-get install -qq git
sudo apt-get install -qq zip unzip
git clone https://github.com/openradar/AMS-Short-Course-on-Open-Source-Radar-Software.git pyart_short_course

# Retrieve the data for the Py-ART course. Adds ~1 GB to the VM size.
cd pyart_short_course/data
./provision_data.sh
