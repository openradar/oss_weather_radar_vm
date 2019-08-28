#!/usr/bin/env bash
# This script clones the pyart course to the VM and runs a script
# to grab data.
set -x
# Get the Py-ART notebooks from GitHub.
cd ~
mkdir data
git clone https://github.com/openradar/AMS-Open-Source-Radar-2019
mv AMS-Open-Source-Radar-2019/pyart ~/

# Retrieve the data for the Py-ART course. Adds ~0.7 GB to the VM size.
bash AMS-Open-Source-Radar-2019/binder/provision.sh
rm -rf AMS-Open-Source-Radar-2019