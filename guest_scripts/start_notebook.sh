#!/bin/bash

cd ~

if [ $# -eq 1 ]
    then echo "Using conda environment $1" && \
            source $CONDA_DIR/bin/activate $1 && \
            jupyter notebook --no-browser --ip=10.0.2.15
    else echo "Using system Python" && \
            jupyter notebook --no-browser --ip=10.0.2.15

fi
