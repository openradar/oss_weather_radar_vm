#!/usr/bin/env bash
get -x
# Get the Py-ART notebooks from GitHub
cd ~
#install git just in case
sudo apt-get install -qq git
git clone https://github.com/EVS-ATMOS/pyart_short_course
#get data
cd pyart_short_course/data
./get_data.sh
#will add more

