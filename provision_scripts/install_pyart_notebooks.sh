#!/usr/bin/env bash
get -x
# Get the Py-ART notebooks from GitHub
cd ~
#install git just in case
sudo apt-get install -qq git
git clone https://github.com/EVS-ATMOS/pyart_short_course
#get data
cd pyart_short_course/data
wget https://engineering.arm.gov/~collis/osrsc/corrected_csapr.nc
wget https://engineering.arm.gov/~collis/osrsc/corrected_xnwsapr.nc
wget https://engineering.arm.gov/~collis/osrsc/corrected_xsesapr.nc
wget https://engineering.arm.gov/~collis/osrsc/corrected_xswsapr.nc
wget https://engineering.arm.gov/~jhelmus/sample_xsapr_a1_files/2013_12_03_NSA/nsaxsaprrhiC1.a1/nsaxsaprrhiC1.a1.20131203.141936.nc

#will add more

