#!/usr/bin/env bash
set -x

# Install wradlib from source
cd ~
sudo apt-get install -qq unzip
wget --no-check-certificate http://github.com/heistermann/baltrad2wradlib/archive/master.zip
unzip master.zip
mv baltrad2wradlib* baltrad2wradlib_demo
sudo rm master.zip
