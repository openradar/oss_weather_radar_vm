# Instructions for importing and running the VM in VirtualBox

* Plug in the flash drive.
* Start VirtualBox.
* In the VirtualBox Manager Window, go to the File menu, 
  choose `Import Appliance`.
* Choose the XXX_64.ova file from the flash drive to import,
  if you are on a 32-bit system or if the 64-bit VM fails repeat
  using the 32-bit VM.
* If you have more than 6 GB of RAM on your system change the RAM to 4096 MB
  from 2048 MB, if you have less than 6 GB leave as 2048 MB
* Click import, wait for the VM to import.
* From the left side listing, choose the `vm_dev_default....` VM, click start.
* When the Text Ubuntu login appears, login as user vagrant using vagrant as the
  password.  In may be necessary to reboot the VM if nothing appears after a
  minute or so.
* One you have logged into the VM, run the command `./start_notebook.sh`.  
  Then open a browser window and navigate to http://127.0.0.1:8888/tree
* At this point you should be able to minimize the VirtualBox Manager and
  the VM window.
