#!/usr/bin/env bash
set -x

# Install radx short course
cd ~
sudo apt-get install -qq unzip
wget --no-check-certificate http://github.com/heistermann/radx_short_course/archive/master.zip
unzip master.zip
mv radx_short_course* radx_short_course
sudo rm master.zip
