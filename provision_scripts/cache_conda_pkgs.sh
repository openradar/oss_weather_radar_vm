#!/usr/bin/env bash
set -x

# cache downloaded conda packages
cp ~/miniconda/pkgs/*.bz2 /vagrant/vendor/conda_pkgs/
