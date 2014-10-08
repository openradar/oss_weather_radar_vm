Build the VM from source
========================

The creation of this VM has been tested on Ubuntu 12.04,
Mac OS X 10.9 and Windows 7 hosts running vagrant 1.5.4.  Other host should
be supported if a recent version of vagrant (1.3+) and VirtualBox 
can be installed.

Requirements
------------

To create and run this VM you need to install
`VirtualBox <https://www.virtualbox.org/>`_ and `vagrant <http://www.vagrantup.com/>`_.  

Download the source `here <https://github.com/openradar/oss_weather_radar_vm/archive/master.zip>`_.

Building
--------

After unpacking the source, create the VM using the command ``vagrant up``.
  
Note that the base box, conda packages and other software is
downloaded when the VM is created which may take a
significant amount of time depending on connection speed.  
The base box and conda packages are cached locally so that
subsequent uses of ``vagrant up`` should complete much quicker
(typically ~10 minutes).

Afterwards, the VM can be accessed from the host machine using the command
`vagrant ssh`.  Launching VirtualBox will show the VM running.

A IPython notebook server can be run from the VM which is
accessible from the host machine.  Use the command ``vagrant ssh``
to ssh into the running VM. For login, use ``vagrant`` with password ``vagrant``.

Use

``$ ./start_notebook.sh`` 

to start the IPython notebook server running on the VM. From the host visit 
http://127.0.0.0:8888/tree to interact with the server.

The VM can be suspeded using ``vagrant suspend`` or stopped using
``vagrant halt``.  The VM can also be paused from the VirtualBox GUI.

Once stopped, the VM can be exported as an ova image file VirtualBox.
This file (~1.4 GB in size) can be shared with end users wanting to 
run the VM using VirtualBox without installing vagrant.  
The username and password for this VM is 'vagrant' and 'vagrant'.

To stop and delete the VM use ``vagrant destroy``.


Export the VM as an applicance
------------------------------

In order to create a VM image (appliance) for distribution, you need to
follow these steps:

* Bring the VM up using ``vagrant up``;
* Power off the VM using ``vagrant halt``;
* From the VirtualBox Manager, select the powered off VM,
  go into the settings and remove all shared folders;
* Under Settings, you can also choose whether to export a 32-bit or 64-bit Ubuntu applicance;
* Still in the Manager from the File Menu, Choose `Export Appliance`,
  and follow the Wizard to export the VM;
* Writing the ova file may take a minute or two.





