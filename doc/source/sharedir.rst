Share data between guest and host
=================================

Why are shared directories useful?
----------------------------------

A useful feature of the virtual machine (VM) concept is that you can
share data between the host (your physical machine) and the guest
(the VM). This way, you can use the software tools
available on the VM for processing (radar) data that
actually resides on your host machine.

How to create a shared directory?
---------------------------------

The procedure of sharing a host directory with the VM
contains two steps.

.. _ref-step1:

Step 1: Define shared directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, you need to define the shared directory, and the name under
which it should be known to the VM. You can do this using the
VirtualBox GUI. 

- Power-off the VM
- In VirtualBox, right-click the VM, and select ``Settings``
- Select the ``Shared Folders`` item, hit the ``Add folder`` icon
- Select the directory you want to share
- Under ``Folder Name``, the folder will be known to the VM
- Use the check boxes to decide whether the folder should be 
  ``read-only`` from the VM, and whether it should be shared permanently; 
  generally, you should not check ``Auto-mount``.
       
Step 2: Mount shared directory on the VM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now start the VM again, log in, and execute::

	$ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) sharedir mountdir

where ``sharedir`` has to be what you chose as ``Folder Name`` above, and
and ``mountdir`` is the target directory in the VM's file system which
must already exist (otherwise, you ned to create it using ``mkdir``).

For example, if your ``Folder Name`` from `Step 1: Define shared directory`_ was ``data2vm``, you could
execute the following on the VM (assume you are in the ``~`` directory)::

	~$ mkdir from_host
	~$ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) data2vm ~/from_host
	~$ ls from_host

The final line is just to verify that the mount was successful, and should
show you the content of your shared directory on the host.
