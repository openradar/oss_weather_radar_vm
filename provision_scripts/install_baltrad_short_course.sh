#!/usr/bin/env bash
set -x

# Clone the BALTRAD short course
cd ~
if ! [ -d tmp ]; then
mkdir tmp
fi
cd tmp
git clone --depth=1 https://github.com/DanielMichelson/baltrad_short_course.git
mv baltrad_short_course ../.
git clone --depth=1 https://github.com/DanielMichelson/baltrad2wradlib.git
mv baltrad2wradlib ../.
cd ~
