# requires VM to have ~2GB of memory
sudo apt-get -qq install xvfb
xvfb-run python -c "import pyart; pyart._debug_info()"
