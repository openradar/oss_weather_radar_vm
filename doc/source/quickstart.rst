Quick start
===========

.. warning::

    We do no longer support 32-bit environments!
    

Requirements
------------

Install `VirtualBox <https://www.virtualbox.org>`_ and :doc:`download
the latest VM image <downloads>`.


Import the VM in VirtualBox
---------------------------

* Start VirtualBox.
* From the File menu, choose ``Import Appliance``.
* Choose the `*.ova` file which you downloaded above
* Check ``Appliance Settings``: make sure that *"Guest OS Type"*  "Debian (64bit)".
* *optional*: under ``Appliance Settings``, you can increase RAM to 4096 MB
  (only recommended if your OS has more than 6 GB RAM).  
* Click ``Import``, wait for the VM to import. The VM should appear on the left sidebar.


Launch the VM
-------------

* In VirtualBox, select the appliance and click the ``Start`` button.
* Wait for VM to boot, then login as user ``vagrant`` with password ``vagrant``.
* In some cases, it may be necessary to reboot the VM if nothing appears after a minute or so (use ``Reset``).


Start jupyter
-------------

Once you have logged into the VM, you can access the course materials by starting a jupyter notebook server. 

However, the VM is currently in a phase of transition: it contains **two Python environments** which are required
by different packages.

**If you want to run BALTRAD or Radx notebooks, execute**

``$ ./start_notebook.sh``

which will run ``jupyter`` from within the system Python (2.7) environment.

**If you want to run Py-ART, wradlib, or PyTMatrix notebooks, execute**

``$ ./start_notebook.sh openradar``

which will run ``jupyter`` from within the ``conda`` Python 3.6 environment ``openradar``.

.. warning::

    As a result of using seperate Python environments, the interoperability demos that run
    BALTRAD, Py-ART and wradlib in *one* environment are currently not operational.
    

Run jupyter notebooks
---------------------

After you have started ``jupyter``, open a browser window on your host machine and
navigate to http://127.0.0.1:8888/tree. For recent versions of ``jupyter``
(i.e. when you used ``$ ./start_notebook.sh openradar``), you need to
copy and paste the `secure token <https://jupyter-notebook.readthedocs.io/en/stable/security.html>`_
into the browser window. The secure token is shown in the VM terminal window.

If you are unable to copy and paste the secure token from the VM terminal into the browser,
you can set a password instead. Shut down the ``jupyter`` server in the VM terminal (``Ctrl+c``),
set a password via, and restart the server::

    $ source $CONDA_DIR/bin/activate openradar
    (openradar) $ jupyter notebook password
    Enter password:
    Verify password:
    ...
    $ ./start_notebook.sh openradar
 
In order to get started, you can choose from a selection of course notebooks. 
See :doc:`here <courses>` for more details on available courses.


Having any problems?
--------------------

There are a some known issues. Please see :doc:`here <knownissues>` how to address them.

If you are experiencing any other problems, please `raise an issue <http://github.com/openradar/oss_weather_radar_vm/issues>`_.


