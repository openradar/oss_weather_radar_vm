# Make a 2 GB swap file and turn on swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=2097152
sudo mkswap /swapfile
sudo swapon /swapfile
