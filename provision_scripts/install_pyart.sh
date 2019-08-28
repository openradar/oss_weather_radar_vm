#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Py-ART.

# install to conda env
source $CONDA_DIR/bin/activate $RADARENV && \
    conda install trmm_rsl cartopy --yes && \
    conda install arm_pyart --no-deps --yes
cd ~

# Optional, test the Py-ART install
#sudo apt-get install -qq python-nose xvfb       # testing dependencies
#xvfb-run python -c "import pyart; pyart.test()"
