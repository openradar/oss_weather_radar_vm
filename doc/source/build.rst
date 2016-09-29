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
  
Note that the base box and other software is
downloaded when the VM is created which may take a
significant amount of time depending on connection speed.  
The base box and software packages are cached locally so that
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
http://127.0.0.1:8888/tree to interact with the server.

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
follow these steps.

**64-bit image**

``$ vagrant up``

``$ vagrant halt``

Use the VirtualBox manager to remove the shared folders, and export the 64-bit image.
For the latter, choose the *File* menu, then *Export Appliance*. Writing the ova file may take a minute or two.

``$ vagrant destroy`` (completely removes the VM)

**32-bit image**

Edit ``Vagrantfile``: comment out lines 11-20, uncomment 24-36

``$ vagrant up``

``$ vagrant halt``

Use the VirtualBox manager to remove the shared folders, and export the 32-bit image.

``$ vagrant destroy``

Load each VM into VirtualBox and test out the notebooks to verify that everything works.
