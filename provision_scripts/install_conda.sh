#!/usr/bin/env bash
set -x

# Debian dependency
sudo apt-get install -qq -y curl

# Configure environment
CONDA_DIR=$HOME/miniconda
RADARENV=openradar
# We do NOT add conda to the path in order to avoid conflicts with system Python
##PATH=$CONDA_DIR/bin:$PATH
##echo "export PATH=$CONDA_DIR/bin:$PATH" >> ~/.profile
echo "export CONDA_DIR=$CONDA_DIR" >> ~/.profile
echo "export RADARENV=$RADARENV" >> ~/.profile

# Configure Miniconda3
export MINICONDA_VER=4.7.10
export MINICONDA=Miniconda3-$MINICONDA_VER-Linux-x86_64.sh
export MINICONDA_URL=https://repo.anaconda.com/miniconda/$MINICONDA
export MINICONDA_MD5_SUM=1c945f2b3335c7b2b15130b1b2dc5cf4

# Install Miniconda3
curl -LO $MINICONDA_URL
# -b option means that .bash_rc will not be modified (avoids conflict with system python)
/bin/bash $MINICONDA -f -b -p $CONDA_DIR
echo "$MINICONDA_MD5_SUM  $MINICONDA" | md5sum -c
rm $MINICONDA

# Configure conda
source $CONDA_DIR/bin/activate && \
conda config --set show_channel_urls True && \
conda config --add channels conda-forge && \
conda config --set channel_priority strict && \
conda update --all --yes && \
conda update conda --yes && \
conda clean -tipy

# Install and activate conda environment
#    (first line is a tweak since the --force option 
#     in conda create" appears not to work)
source $CONDA_DIR/bin/activate && \
    conda env remove --name $RADARENV --yes || echo "environment $RADARENV does not yet exist" && \
    conda create --name $RADARENV python=3.6 --yes
