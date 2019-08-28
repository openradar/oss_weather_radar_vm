#!/usr/bin/env bash
# This script clones the pyart course to the VM and runs a script
# to grab data.
set -x
# Get the Py-ART notebooks from GitHub.
cd ~
git clone https://github.com/EVS-ATMOS/pyart-notebooks.git pyart_short_course

# Retrieve the data for the Py-ART course. Adds ~0.7 GB to the VM size.
cd pyart_short_course/data
./provision_data.sh
