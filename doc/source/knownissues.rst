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

If you are working on a 32-bit OS, you need to install a 32-bit VM image.

If you are working on a 64-bit OS, you need to install a 64-bit VM image.

Very simple.

When you import the image to VirtualBox, check the ``Appliance Settings``:
For the 32bit image, make sure that *"Guest OS Type"* is "Ubuntu (32bit)", 
otherwise choose "Ubuntu (64bit)". 






