#!/usr/bin/env bash

# This updates wradlib itself and the course notebooks (not wradlib-data!)
set -x

cd ~
mkdir tmp
cd tmp
git clone --depth=1 https://github.com/wradlib/wradlib.git
cd wradlib
sudo python setup.py install
cd ~
sudo rm -rf wradlib_short_course
mkdir wradlib_short_course
cp -a tmp/wradlib/notebooks/ ~/wradlib_short_course/
sudo rm -rf tmp
