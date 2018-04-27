# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # Configure cached packages to be shared between instances of the same base box.
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.vm.box = "debian/stretch64"
  config.vm.box_url = "https://vagrantcloud.com/debian/boxes/stretch64/versions/9.2.0/providers/virtualbox.box"
  # The .box file can also be specified as a file on the local machine,
  # comment the above config.vm.box line, uncomment and edit the next line.
  #config.vm.box_url = "file:///home/.../trusty-server-cloudimg-amd64-vagrant-disk1.box"
  
  # configure VM instance
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end  
 
  # A 32-bit VM can also be create, comment out the above block and
  # uncomment this block
  #config.vm.box = "trusty32"
  #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
  # configure VM instance
  #config.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
  #  vb.customize ["modifyvm", :id, "--memory", "2048"]
  #  ## You might need to uncomment the following if built times out after "default: SSH auth method: private key"
  #  ## Change network card to PCnet-FAST III 
  #  ## For NAT adapter
  #  #vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
  #  ## For host-only adapter
  #  #vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
  #end 

  # Forward the default Jupyter port
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  # Forward the httpd port
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.ssh.forward_agent = true
  
  # Provision machine with open source radar software.
  
  # Requirements not related to Python or a specific package
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_common.sh"
  
  # Python environment (system, not conda)
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_scipy_stack.sh"
  
  # Python environment (conda)
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_conda.sh"
  
  # wradlib to conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_wradlib.sh"
  
  # Py-ART to system Python and conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart_notebooks.sh"
  
  # BALTRAD
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_common.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_hlhdf.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_bbufr.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave.sh"  
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_beamb.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_bropo.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_rave_gmap.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_wrwp.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_finalize.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_baltrad_short_course.sh"
  
  # Radx
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_radx.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_radx_short_course.sh"

  # PyTMatrix to system Python and conda
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pytmatrix.sh"
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pytmatrix_short_course.sh"
  
  # Interoperability demo
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/install_pyart2baltrad_course.sh"

  # copy VM scripts
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/copy_guest_scripts.sh"

  # cleanup
  config.vm.provision :shell, :privileged => false, :path => "provision_scripts/cleanup.sh" 

end
