#!/usr/bin/env bash
set -x

# Clone the BALTRAD short course
cd ~/tmp
git clone --depth=1 https://github.com/DanielMichelson/baltrad_short_course.git
mv baltrad_short_course ../.
cd ~
