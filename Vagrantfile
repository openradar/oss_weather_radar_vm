# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Configure cached packages to be shared between instances of the same base box.
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  # The .box file can also be specified as a file on the local machine,
  # comment the above config.vm.box line, uncomment and edit the next line.
  #config.vm.box_url = "file:///home/jhelmus/projects/erad_tutorial/boxes/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  
  # configure VM instance
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end  
  
  # forward the default IPython port
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  
  config.ssh.forward_agent = true
  
  # provision machine with open source radar software.
  
  # Python environment, system
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_scipy_stack.sh"
  
  # BUFR
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_bufr.sh"

  # Py-ART
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart.sh"
  
  # wradlib
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_wradlib.sh"
  
  # Baltrad
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_common.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_hlhdf.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_bbufr.sh"
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave.sh" 
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_beamb.sh"
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_bropo.sh"
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave_gmap.sh"
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_baltrad_wrwp.sh"

  # cache conda packages
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/cache_conda_pkgs.sh"
  
  # copy VM scripts
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/copy_guest_scripts.sh"

  # cleanup
  #config.vm.provision :shell, :privileged => false, :path => "provision_scripts/cleanup.sh" 

end
