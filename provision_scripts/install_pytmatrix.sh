#!/usr/bin/env bash
set -x

# PyTMatrix install in system Python
#sudo pip install pytmatrix

# PyTMatrix install in conda env
source $CONDA_DIR/bin/activate $RADARENV && \
    conda install --yes pytmatrix

