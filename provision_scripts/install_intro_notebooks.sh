#!/usr/bin/env bash
# This script clones the intro course to the VM
set -x
# Get the intro notebooks from GitHub.
cd ~
# Install git and zip/unzip just in case.
sudo apt-get install -qq git
sudo apt-get install -qq zip unzip
git clone https://github.com/EVS-ATMOS/introductory_python
