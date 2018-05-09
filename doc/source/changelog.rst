Changelog
=========

Changes in version 0.5.0
------------------------

Released on 2018-05-08 by Maik Heistermann

Virtual machine image was built based on the following revision:
https://github.com/openradar/oss_weather_radar_vm/commit/7860e80a7d36ef544c819cb5c47ab3ef0da8ab29

Most important changes:

- Dropping support for 32-bit environments
- Using Debian 9 (Stretch) as guest OS (instead of Ubuntu 12.04)
- As a result, system Python is ``2.7``
- Adjusted BALTRAD provisioning accordingly
- Introduced Miniconda and conda environments
- wradlib, Py-ART and PyTMatrix are installed in conda ``Python 3.6`` environment ``openradar``
- ``./start_notebook.sh`` takes argument ``openradar`` in order to start jupyter from conda environment ``openradar``
- new jupyter version required authentication (secure token or password)
- interoperability demos do not work (due to seperate Python environments)
- updated wradlib to version 1.0.0
- updated Py-ART to version to 1.9.0 (picasso)


Changes in version 0.4.0
------------------------

Released on 2016-09-26 by Maik Heistermann

Virtual machine image was built based on the following revision:
https://github.com/openradar/oss_weather_radar_vm/commit/ac0f45db49f03e6267d77fdf57e8f4714bcd6492

Most important changes:

- Updated to wradlib 0.9.1
- Updated to Py-ART 1.7.0
- wradlib-data installed from https://github.com/wradlib/wradlib-data
- Fundamental update of wradlib course notebooks in folder wradlib_short_course
- Update of Py-ART course notebooks
- Update of BALTRAD course notebooks
- Removed BALTRAD dependencies on jprops and keyczar


Changes in version 0.3.1
------------------------

2015-06-03  Daniel Michelson  <dbm@baltrad.eu>

Virtual machine images should be based on the exact same commit as was used for version 0.3.0.

Most important changes:

- No changes to the provisioning scripts, ie. the build process. 
- The changes are that these images contain the latest version of
  BALTRAD's RAVE subsystem. This is RAVE build #457.


Changes in version 0.3.0
------------------------

Virtual Machine image was built based on commit 6589878db1113899d032a775c11b4eaefb39ffbc

https://github.com/openradar/oss_weather_radar_vm/commit/6589878db1113899d032a775c11b4eaefb39ffbc

Most important changes:

- new wradlib version (0.5.1)

- new Radx version (20141125)

- removal of some duplicate libraries


Changes in version 0.2.1
------------------------

Virtual Machine image was built based on commit ac0f45db49f03e6267d77fdf57e8f4714bcd6492

See https://github.com/openradar/oss_weather_radar_vm/commit/ac0f45db49f03e6267d77fdf57e8f4714bcd6492

Most importantly, the new version contains Radx and a Radx short course template.

Also recent changes in the course materials were considered in this built.

