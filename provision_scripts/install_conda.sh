#!/usr/bin/env bash
set -x

# Configure environment
CONDA_DIR=$HOME/miniconda
PATH=$CONDA_DIR/bin:$PATH
echo "export PATH=$CONDA_DIR/bin:$PATH" >> ~/.profile

# Configure Miniconda3
export MINICONDA_VER=4.3.11
export MINICONDA=Miniconda3-$MINICONDA_VER-Linux-x86_64.sh
export MINICONDA_URL=https://repo.continuum.io/miniconda/$MINICONDA
export MINICONDA_MD5_SUM=1924c8d9ec0abf09005aa03425e9ab1a

# Install Miniconda3
curl -LO $MINICONDA_URL
/bin/bash $MINICONDA -f -b -p $CONDA_DIR
echo "$MINICONDA_MD5_SUM  $MINICONDA" | md5sum -c
rm $MINICONDA

# Configure conda
conda config --set show_channel_urls True
conda config --add channels conda-forge
conda update --all --yes
conda update conda --yes
conda clean -tipy


