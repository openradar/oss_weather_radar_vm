#!/usr/bin/env bash
set -x

# Installation of system-wide general requirements (not Python-related)
sudo apt-get update -qq
sudo apt-get install -qq git
sudo apt-get install -qq unzip
