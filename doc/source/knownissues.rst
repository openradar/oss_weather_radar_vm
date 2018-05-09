Known Issues
============

Weird keyboard layout inside the VM
-----------------------------------

If you are "inside" the appliance window, you might find that the
keyboard mapping is weird. This is probably a `QWERTZ <https://en.wikipedia.org/wiki/QWERTZ>`_ 
vs `QWERTY <https://en.wikipedia.org/wiki/QWERTZ>`_ issue. Example: 
You hit ``z`` and get a ``y``. The VM adopts a US keyboard mapping by default which
*might* cause problems in case your keyboard is mapped for another country. There
are two ways to change the keyboard mapping: permanently, or just for the current session.

Change keyboard mapping permanently
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On the VM shell, execute::

	$ sudo dpkg-reconfigure keyboard-configuration

Walk through the menu: in most cases, you can just confirm the default settings by hitting ``Enter``.
However, carefully choose the adequate country in the sub-menu ``Country of origin for the keyboard``. 


Change keyboard mapping just for current session
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For this, you need to install ``console-data``::

	$ sudo apt-get install console-data 

from the VM shell. During the installation process, you will be able to 
choose an appropriate keyboard layout: choose ``Select keymap from arch list``, 
then continue according to your keyboard layout (typically ``qwertz`` or ``qwerty``)
and country.
 
In case you already have ``console-data`` installed, just execute::

	$ sudo dpkg-reconfigure console-data

instead, and follow the same procedure.


System Python vs. conda
-----------------------

The VM contains two Python distributions: ``Python 2.7`` that comes with Debian 9 (used by BALTRAD and Radx),
and a ``Python 3.6`` `conda environment <https://conda.io/docs/index.html>`_ (used by Py-ART, wradlib, 
and PyTMatrix). We tried to minimize conflicts between the two Python environments. Please see
:doc:`quickstart` on how to launch ``jupyter`` notebooks in the different Python environments. 

Still, a problem might occur in case a the metadata of a ``jupyter`` notebook refers to Python 2, although
the notebook would require to be run from within the ``conda`` Python 3.6 environment. If your notebook
fails and shows an active ``Python 2`` kernel, please switch manually to a ``Python 3`` kernal using the
notebooks GUI. Alternatively, you can edit the notebooks metadata to refer to Python 3, and then restart
the notebook.


Using conda
-----------

In order to avoid conflicts with the system Python, we did not add ``conda`` to the ``PATH`` environment variable.
If you want to execute ``conda`` commands on the VM, you need to make use of the environment variable ``$CONDA_DIR``
which points to ``conda``'s installation directory. Instead of e.g. activating the conda environment ``openradar`` via 

``$ source activate openradar``

please use

``$ source $CONDA_DIR/bin/activate openradar``


32-bit vs. 64-bit
-----------------

We do no longer support 32-bit environments. If you have a 32-bit host environment,
the 64-bit will fail. That applies both for the :doc:`image downloads <downloads>`
and for :doc:`builts from source <build>`. Still, you might find some guidance :doc:`here <build>`
on how to build a 32-bit image yourself. 

When you import the image to VirtualBox, check the ``Appliance Settings``:
Make sure that *"Guest OS Type"* is "Debain (64bit)".


Enabling virtualization
-----------------------

Disabled hardware virtualization features on the host system can lead to weird error messages
(such as "VT-x/AMD-V hardware acceleration is not available on your system"). This particularly 
applies to Windows, but virtualization support can also be disabled on Linux
hosts. The way how to enable virtualization support depends on the system. Please read 
`this article <http://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/>`_
on how the issue might be adressed on Windows hosts - usually you need to change the
BIOS settings to enable virtualization support.


Cleaning up after removing a VM
-------------------------------

If you want to remove an appliance from your computer, you can use the VirtualBox manager, 
select the appliance, and click "Remove".

However, in some cases, VirtualBox might not remove all the corresponding VM files from your file system.
In that case you need to do that manually. Under ``File`` > ``Preferences``, find your "Default Machine Folder".
Navigate there and delete the remaining directories that correspond to the appliance you want to remove. 

 






