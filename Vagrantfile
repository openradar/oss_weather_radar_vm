# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Configure cached packages to be shared between instances of the same base box.
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.vm.box = "debian/buster64"
  config.vm.box_url = "https://vagrantcloud.com/debian/boxes/buster64/versions/10.0.0/providers/virtualbox.box"
  # The .box file can also be specified as a file on the local machine,
  # comment the above config.vm.box line, uncomment and edit the next line.
#  config.vm.box_url = "file:///Users/baltrad/Desktop/stretch64_9.2.0_virtualbox.box"
  config.ssh.forward_x11 = true
  # configure VM instance
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the default Jupyter port
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  # Forward the httpd port
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # Forward SSH port to not conflict with Trusty
  config.vm.network :forwarded_port, guest: 22, host: 2223, id: 'ssh'
  
  config.ssh.forward_agent = true
  
  # Provision machine with open source radar software.

  # Requirements not related to Python or a specific package
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_common.sh"
  
  # Python3 environment (conda)
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_conda.sh"

  # wradlib to conda (incl. jupyter and other major dependencies)
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_wradlib.sh"
  
  ## Py-ART to conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart_notebooks.sh"
  
  # BALTRAD to conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_hlhdf.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_beamb.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_bropo.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave_gmap.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_wrwp.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_short_course.sh"
  
  # Radx
  # not python 3 ready
  # config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_radx.sh"
  # config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_radx_short_course.sh"

  # PyTMatrix to conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pytmatrix.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pytmatrix_short_course.sh"
  
  # Interoperability demo
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart2baltrad_course.sh"

  # Intro to Python, Jupyter and Scipy
  config.vm.provision :shell, :privileged => false, :path =>"provision_scripts/install_intro_notebooks.sh"

  # copy VM scripts
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/copy_guest_scripts.sh"

  # cleanup
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/cleanup.sh" 

end
