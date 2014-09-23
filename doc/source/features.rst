Features
========

The Virtual Machine (VM) is based on Linux (Ubuntu) and comes with a 
number of open source weather radar software packages. The VM can be run using VirtualBox 
on most operating systems (Linux, Mac, Windows).

Weather Radar Software
----------------------

`BALTRAD <http://baltrad.eu/>`_

`Py-ART <http://arm-doe.github.io/pyart/>`_

`wradlib <http://wradlib.bitbucket.org>`_

`Radx <http://www.ral.ucar.edu/projects/titan/docs/radial_formats/radx.html>`_


Python
------

The VM comes with a scientific Python stack, including the most important Python Packages
for scientific computing (numpy, scipy and many more). The VM also contains `IPython <http://ipython.org/>`_.

A convenient way to use IPython is the `IPython notebook <http://ipython.org/notebook.html>`_. From the VM
root directory, run

``$ ./start_notebook.sh``

Open a browser on your host machine and navigate to http://127.0.0.0:8888/tree.

See :doc:`quickstart` for further infos.


Webserver
---------

The VM also contains an Apache Webserver.


Course materials
----------------

The VM contains courses with recipes and examples in order to make you familiar with the different software packages. Some examples
also show how to combine different weather radar packages.

See :doc:`courses <courses>` for further details.