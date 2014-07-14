#!/usr/bin/env bash
set -x

# Install wradlib from source
cd ~
sudo apt-get install -qq unzip
wget --no-check-certificate http://bitbucket.org/heisterm/wradlib_short_course/get/default.zip
unzip default.zip
mv heisterm-wradlib_short* wradlib_short_course
sudo rm default.zip
