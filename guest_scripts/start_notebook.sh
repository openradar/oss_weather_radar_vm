#!/bin/bash

cd ~
source $CONDA_DIR/bin/activate $RADARENV && \
    jupyter notebook --no-browser --ip=10.0.2.15
