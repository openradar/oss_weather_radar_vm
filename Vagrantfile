# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  
  # configure VM instance
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end  
  
  # forward the default IPython port
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  
  config.ssh.forward_agent = true
  
  # provision machine with open source radar software.
  #config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :privileged => false, :path => "user_install_miniconda.sh"
  #config.vm.provision :shell, :privileged => false, :path => "user_install_pyart.sh"
  #config.vm.provision :shell, :privileged => false, :path => "user_install_wradlib.sh"
  
  # Baltrad
  config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_common.sh"
  config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_hlhdf.sh"
  #config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_rave.sh"
  
  #config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_beamb.sh"
  #config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_bropo.sh"
  
  #config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_rave_gmap.sh"
  #config.vm.provision :shell, :privileged => false, :path => "user_install_baltrad_baltrad_wrwp.sh"

end
