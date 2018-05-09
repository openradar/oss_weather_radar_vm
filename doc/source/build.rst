Build the VM from source
========================

Building VM has been tested on Ubuntu, Mac OS X, and Windows 7 hosts, 
running various vagrant and VirtualBox versions. Other host should
be supported as well. The most recent setup was using vagrant 1.9.6 and VirtualBox 5.1.

Recently, the guest OS (i.e. the OS on the VM) was changed from Ubuntu 12.04 (trusty) to Debian 9 (Stretch).

Requirements
------------

To build and run this VM you need to install
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
`vagrant ssh`. Launching VirtualBox will show the VM running.

An IPython/jupyter notebook server can be run from the VM which is
accessible from the host machine.  Use the command ``vagrant ssh``
to ssh into the running VM. For login, use ``vagrant`` with password ``vagrant``.

The VM can be suspeded using ``vagrant suspend`` or stopped using
``vagrant halt``.  The VM can also be paused from the VirtualBox GUI.

To stop and delete the VM use ``vagrant destroy``.


Export the VM as an applicance
------------------------------

Once stopped, the VM can be exported as an ova image ("appliance") via VirtualBox.
This file (2-3 GB in size) can be shared with other users in order to 
run the VM via VirtualBox without installing vagrant.  
The default username and password for this VM is ``vagrant`` and ``vagrant``.

In order to create the image, you need to follow these steps.

**64-bit image**

``$ vagrant up``

``$ vagrant halt``

Use the VirtualBox manager to remove the shared folders (``Settings -> Shared Folders``). 
Set the guest OS explicitely to ``Debian (64-bit)`` via ``Settings -> General -> Version``. 
Then export the 64-bit image via ``File -> Export Appliance``. 
Writing the ova file may take a minute or two. Then optionally remove the VM either via

``$ vagrant destroy``

or via the VirtualBox GUI.

**32-bit image**

.. warning::

    We do no longer support 32-bit environments!

You still might get it to work, though, by finding a suitable 32-bit Vagrant box for Debian 9 (e.g. https://app.vagrantup.com/koalephant/boxes/debian9-i386), and edit the ``Vagrantfile``
accordingly:

Edit ``Vagrantfile``: comment out lines 18-20, uncomment 24-35 and edit ``config.vm.box``. Then

``$ vagrant up``

``$ vagrant halt``

Use the VirtualBox manager to remove the shared folders (``Settings -> Shared Folders``). 
Set the guest OS explicitely to ``Debian (32-bit)`` via ``Settings -> General -> Version``. 
Then export the 32-bit image via ``File -> Export Appliance``. 
Writing the ova file may take a minute or two. Then optionally remove the VM either via

``$ vagrant destroy``


Reducing the size of the VM appliance
-------------------------------------
Before exporting the VM appliance, you might want to try reducing the size of the VM by releasing memory that is not used.

- in the VM terminal, unlock the ``root`` account via ``sudo passwd root``

- enter and verify ``root`` password (preferably leave it with ``vagrant``)

- in the VM terminal, do ``sudo apt-get install zerofree``

- restart the VM via VirtualBox GUI

- Immediately press and hold ``Esc`` until you see the ``GNU GRUB`` menu. If you see the log in terminal, you were too late in pressing ``Esc``

- Choose ``Advanced options for Debian/GNU Linux``

- Choose ``... (recovery mode)``

- authenticate using your ``root`` password

- ``service rsyslog stop``

- ``killall dhclient`` 

- ``mount -r -o remount /dev/sda1``

- ``zerofree -v /dev/sda1``

- ``exit`` from recovery mode and shut down the VM

- export appliance as shown above

