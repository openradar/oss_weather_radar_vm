#!/usr/bin/env bash
set -x

# Global BALTRAD setup
##sudo apt-get install -qq git -> moved to install_common.sh
sudo mkdir /opt/baltrad
sudo chown vagrant:vagrant /opt/baltrad

# make a site-packages directory for BALTRAD to install into
# see discussion in install_baltrad_finalize.sh for details
sudo mkdir /usr/lib/python2.7/site-packages
sudo chown vagrant:vagrant /usr/lib/python2.7/site-packages
