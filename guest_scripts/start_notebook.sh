cd ~

if [$# = 1]
    then jupyter notebook --no-browser --ip=10.0.2.15
    else source $CONDA_DIR/bin/activate $1 && \
            jupyter notebook --no-browser --ip=10.0.2.15
fi
