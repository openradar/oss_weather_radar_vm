Features
========

The Virtual Machine (VM) is based on Linux (Ubuntu) and comes with a 
number of open source weather radar software packages. The VM can be run using VirtualBox 
on most operating systems (Linux, Mac, Windows).

Weather Radar Software
----------------------

`BALTRAD <http://git.baltrad.eu/>`_

`Py-ART <http://arm-doe.github.io/pyart/>`_

`wradlib <http://wradlib.org>`_

`Radx <http://www.ral.ucar.edu/projects/titan/docs/radial_formats/radx.html>`_

`PyTMatrix <https://github.com/jleinonen/pytmatrix>`_


Python
------

The VM comes with a scientific Python stack, including the most important Python Packages
for scientific computing (NumPy, SciPy and many more), and `jupyter <https://jupyter.org/>`_
in order to run the course notebooks.

See :doc:`quickstart` to see how to run ``jupyter`` notebooks on the VM.

**Two Python distributions**

Right now, we are in a phase of transition in which some packages have already moved on
to Python 3, while others still rely on Python 2 (see 
`here <https://https://docs.python.org/3/howto/pyporting.html>`_ for some background).

As a result, the VM, as of now, contains two Python distributions:

- the system Python is 2.7, and the installation of Python packages is based on the Debian 9 (Stretch) package manager. The system Python is mainly used by the BALTRAD package.

- the VM also contains `Miniconda with Python 3.6 <https://conda.io/miniconda.html>`_. Using the `conda <https://conda.io/docs/index.html>`_ package manager, we maintain a 3.6 ``conda`` Python environment that contains wradlib, Py-ART and PyTMatrix.

As a result, the interoperability demos for BALTRAD, Py-ART, and wradlib are, as of now, not operational.
We are working on a solution to integrate all packages in a unified Python environment, again.

See :doc:`quickstart` to see how ``jupyter`` notebooks can be invoked in the two different Python environments.


Webserver
---------

The VM also contains an Apache Webserver.


Course materials
----------------

The VM contains courses with recipes and examples in order to make you familiar with the different software packages. Some examples
also show how to combine different weather radar packages.

See :doc:`courses <courses>` for further details.

