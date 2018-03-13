#!/usr/bin/env bash
set -x

# Configure environment
CONDA_DIR=$HOME/miniconda
RADARENV=openradar
# We do NOT add conda to the path in order to avoid conflicts with system Python
##PATH=$CONDA_DIR/bin:$PATH
##echo "export PATH=$CONDA_DIR/bin:$PATH" >> ~/.profile
echo "export CONDA_DIR=$CONDA_DIR" >> ~/.profile
echo "export RADARENV=$RADARENV" >> ~/.profile

# Configure Miniconda3
export MINICONDA_VER=4.3.11
export MINICONDA=Miniconda3-$MINICONDA_VER-Linux-x86_64.sh
export MINICONDA_URL=https://repo.continuum.io/miniconda/$MINICONDA
export MINICONDA_MD5_SUM=1924c8d9ec0abf09005aa03425e9ab1a

# Install Miniconda3
curl -LO $MINICONDA_URL
# -b option means that .bash_rc will not be modified (avoids conflict with system python)
/bin/bash $MINICONDA -f -b -p $CONDA_DIR
echo "$MINICONDA_MD5_SUM  $MINICONDA" | md5sum -c
rm $MINICONDA

# Configure conda
$CONDA_DIR/bin/conda config --set show_channel_urls True
$CONDA_DIR/bin/conda config --add channels conda-forge
$CONDA_DIR/bin/conda update --all --yes
$CONDA_DIR/bin/conda update conda --yes
$CONDA_DIR/bin/conda clean -tipy

# Install and activate conda environment
#    (first line is a tweak since the --force option 
#     in conda create" appears not to work)
$CONDA_DIR/bin/conda env remove --name $RADARENV --yes || echo "environment $RADARENV does not yet exist"
$CONDA_DIR/bin/conda create --name $RADARENV python=3.6 --yes


