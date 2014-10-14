Known Issues
============

Weird keyboard layout inside the VM
-----------------------------------

If you are "inside" the appliance window, you might find that the
keyboard mapping is weird. One way to fix it is to install ``console data``:

If you're logged in the VM, call 

``$apt-get install console-data`` 

from the shell. During the installation process, you will be able to choose an appropriate keyboard layout.


32-bit vs. 64-bit
-----------------

If you are working on a 32-bit OS, you should install a 32-bit VM image.

If you are working on a 64-bit OS, you should install a 64-bit VM image.

When you import the image to VirtualBox, check the ``Appliance Settings``:
For the 32bit image, make sure that *"Guest OS Type"* is "Ubuntu (32bit)", 
otherwise choose "Ubuntu (64bit)".

**Try the 32-bit image when import or booting of the 64-bit appliance fails (and vice versa).**


Cleaning up after removing a VM
-------------------------------

If you want to remove an appliance from your computer, you can use the VirtualBox manager, 
select the appliance, and click "Remove".

However, in some cases, VirtualBox might not remove all the corresponding VM files from your file system.
In that case you need to do that manually. Under ``File`` > ``Preferences``, find your "Default Machine Folder".
Navigate there and delete the remaining directories that correspond to the appliance you want to remove. 

 






