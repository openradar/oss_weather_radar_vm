# An Open Source Weather Radar VM build using Vagrant. #

This projects creates a Linux Virtual Machine image (VM) with a number
of open source weather radar software packages 
(BALTRAD, Py-ART, PyTMatrix, Radx, RSL, and wradlib) which can be run using VirtualBox on a
number of host OSes.

The creation of this VM has been tested on Ubuntu 12.04 and
Mac OS X 10.9 hosts running vagrant 1.5.4.  Other host should
be supported if a recent version of vagrant (1.3+) and VirtualBox 
can be installed. Subsequent versions of this project have used Debian Linux
and subsequent versions of both vagrant and VirtualBox.

## Requirements ##

To create and run this VM you will need to install
[VirtualBox](https://www.virtualbox.org/) and [vagrant](http://www.vagrantup.com/).  

## Use ##

Once these two packages are installed and this git repository
is cloned, create the VM using the command `vagrant up`.  
Note that the base box, Python packages and other software are
downloaded when the VM is created which may take a
significant amount of time depending on connection speed.  
The base box is cached locally so that
subsequent uses of `vagrant up` should complete much quicker
(typically ~10 minutes).

The VM can be access from the host computer using the command
`vagrant ssh`.  Launching the VirtualBox gui will show the VM running.

A JuPyter notebook server can be run from the VM which is
accessible from the host machine.  Use the command `vagrant ssh`
to ssh into the running VM.  Then use `./start_notebook.sh` to start
the JuPyter notebook server running on the VM.  From the host visit 
[127.0.0.1:8888](http://127.0.0.1:8888) to interact with the 
server.

The VM can be suspeded using `vagrant suspend` or stopped using
`vagrant halt`.  The VM can also be paused from the VirtualBox gui.
Once stopped the VM can be exported to an ova format using the
VirtualBox gui.  This file (~1.4 GB in size) can be shared with
end users wanting to run the VM using VirtualBox without
installing vagrant.  The username and password for this VM is
'vagrant' and 'vagrant'.

To stop and delete the VM use `vagrant destroy`.
