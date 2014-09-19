Quick start
===========

Requirements
------------

Install `VirtualBox <https://www.virtualbox.org>`_ and :doc:`download
the latest VM image <downloads>`.


Import the VM
-------------

* Start VirtualBox.
* From the File menu, choose ``Import Appliance``.
* Choose the `*.ova` file which you downloaded above 
  
  (be sure it is the right VM image for your OS: *32-bit vs. 64-bit*).
* Check ``Appliance Settings``: for the 32bit image, make sure that *"Guest OS Type"* 
  is "Ubuntu (32bit)", otherwise choose "Ubuntu (64bit)".
* *optional*: under ``Appliance Settings``, you can increase RAM to 4096 MB
  (only recommended if your OS has more than 6 GB RAM).  
* Click ``Import``, wait for the VM to import. The VM should appear on the left sidebar.

Launch the VM
-------------

* In VirtualBox, select the appliance and click the ``Start`` button.
* Wait for VM to boot, then login as user *vagrant* with password *vagrant*.
* In some cases, it may be necessary to reboot the VM if nothing appears after a minute or so (use ``Reset``).

Start the IPython notebook
--------------------------

Once you have logged into the VM, run the command 

``$ ./start_notebook.sh``.

Then open a browser window on your host machine and navigate to http://127.0.0.0:8888/tree.

In order to get started, you can choose from a selection of course notebooks. 
See :doc:`here <courses>` for more details on available courses.


