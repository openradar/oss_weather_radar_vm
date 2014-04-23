# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.ssh.forward_agent = true
  #config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :privileged => false, :path => "user_install_miniconda.sh"
end

# forward the default IPython port
Vagrant.configure("2") do |config|
    config.vm.network "forwarded_port", guest: 8888, host: 8888
end
