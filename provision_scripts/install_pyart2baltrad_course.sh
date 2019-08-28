#!/usr/bin/env bash
set -x
cd ~
rm -rf pyart2baltrad
git clone --depth=1 https://github.com/DanielMichelson/pyart2baltrad.git
