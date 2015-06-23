#!/usr/bin/env bash
set -x

# finalize Baltrad install

# This is a hack to get the BALTRAD modules pointed to by .pth files into
# the Python search path.  BALTRAD's make install creates .pth files
# in /usr/lib/python2.7/site-packages/ but Debian uses dist-packages.  The
# solution is to make a site-packages directory owned by the user vagrant
# allow BALTRAD to install into that directory then copy these .pth files
# into the /usr/local ... dist-packages directory in the Python search path.
sudo cp /usr/lib/python2.7/site-packages/* /usr/local/lib/python2.7/dist-packages/
