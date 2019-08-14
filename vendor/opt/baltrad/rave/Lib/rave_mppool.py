#!/usr/bin/env python
'''
Copyright (C) 2014- Swedish Meteorological and Hydrological Institute (SMHI)

This file is part of RAVE.

RAVE is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

RAVE is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with RAVE.  If not, see <http://www.gnu.org/licenses/>.
'''

## Class for creating non-daemonic process pools.

## @file
## @author Daniel Michelson, SMHI
## @date 2014-09-30


import multiprocessing
import multiprocessing.pool


## Inherit Process
#  @param Process object
class NonDaemonProcess(multiprocessing.Process):
    # make 'daemon' attribute always return False
    def __init__(self):
        super(NonDaemonProcess,self).__init__()
    def _get_daemon(self):
        return False
    def _set_daemon(self, value):
        pass
    daemon = property(_get_daemon, _set_daemon)


## We sub-class multiprocessing.pool.Pool instead of multiprocessing.Pool
#  because the latter is only a wrapper function, not a proper class.
# @param Pool with our NonDaemonProcess
class RavePool(multiprocessing.pool.Pool):
    def Process(self, *args, **kwds):
        proc = super(RavePool, self).Process(*args, **kwds)

        class NonDaemonProcess(proc.__class__):
            """Monkey-patch process to ensure it is never daemonized"""
            @property
            def daemon(self):
                return False

            @daemon.setter
            def daemon(self, val):
                pass

        proc.__class__ = NonDaemonProcess
        return proc


if __name__ == "__main__":
    pass
