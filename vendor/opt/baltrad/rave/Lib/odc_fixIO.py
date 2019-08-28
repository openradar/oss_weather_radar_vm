#!/usr/bin/env python
'''
Copyright (C) 2012- Swedish Meteorological and Hydrological Institute (SMHI)

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

## Routines for validating and harmonizing file contents.

## @file
## @author Daniel Michelson, SMHI
## @date 2012-11-05

import _raveio
import odim_source
from rave_defines import UTF8
from numpy import *


## Validate input file.
# @param rio RAVE IO object read from file.
def Validate(rio):
    # Zero check: do we have a payload?
    if not rio.object:
        raise IOError("Failed to read file.")

    # First ODIM violation fix: ODIM_BUFR cannot tell the difference between
    # a SCAN and a PVOL. ODIM_H5 can.
    if rio.objectType == _raveio.Rave_ObjectType_PVOL and rio.object.getNumberOfScans() == 1:
        DATE, TIME = rio.object.date, rio.object.time
        rio.object = rio.object.getScan(0)
        rio.object.date, rio.object.time = DATE, TIME

    # Second (potential) ODIM violation: bad or incomplete value of /what/source
    # Harmonize, because bRopo looks up filter settings based on this attribute.
    try:
        odim_source.CheckSource(rio.object)
        s = odim_source.ODIM_Source(rio.object.source)
        if not s.nod: raise AttributeError()
        if not s.wmo:
            rio.object.source = odim_source.SOURCE[s.nod].encode(UTF8)
    except:
        rio.object.source=repair_odim_source(rio.object)
        s = odim_source.ODIM_Source(rio.object.source)

    # Third issue, not an ODIM violation as such: ODIM_BUFR returns datasets as
    # float64 arrays, which a massive waste of RAM. Harmonize to uint8.
    # Note: this is not a problem for the toolbox as such, but it is a problem
    # for Ropo because Ropo assumes uint8 data.
    if rio.file_format == _raveio.RaveIO_ODIM_FileFormat_BUFR:
        ConvertDatasets(rio)

    # Step 4: combination of data and metadata fixes.
    # In one known instance, a country supplies TH but not DBZH data. bRopo
    # currently requires DBZH, so in these cases rename TH to DBZH.
    # Very few countries supply their data violating the ancient GORN "rules"
    # for nodata and undetect, but it happens, so identify and fix.
    # Note: this is not a problem for the toolbox as such, but it is a problem
    # for Ropo because Ropo assumes standard values.
    # Unfortunately, all data must be checked.
    # While we're at it, perform a sanity check on the values of 'where/rstart'
    # and 'where/rscale'. This is an ODIM violation that doesn't need
    # correcting for ropo, but should be correctly represented for use by
    # other parts of the toolbox if required.
    CheckOddsnEnds(rio)


## Fix bad WMO numbers, among other things. This is a collection of workarounds.
# @param obj input object
# @return string containing correctly-formatted /what/source
def repair_odim_source(obj):
    import re

    source = obj.source
    # France - Falaise
    if obj.source == 'WMO:07027':
        return odim_source.SOURCE["frcae"].encode(UTF8)
    # France - Nancy
    elif obj.source == 'WMO:07180':
        return odim_source.SOURCE["frnan"].encode(UTF8)
    # France - Nimes
    elif obj.source == 'WMO:07645':
        return odim_source.SOURCE["frnim"].encode(UTF8)
    # France - Arcis
    elif obj.source == 'WMO:07168':
        return odim_source.SOURCE["frtro"].encode(UTF8)
    # France - Sembadel
    elif obj.source == 'WMO:07471':
        return odim_source.SOURCE["frlep"].encode(UTF8)
    # Cerceda - Spain
    elif obj.source[:9] == 'WMO:08007':
        return odim_source.SOURCE["escor"].encode(UTF8)
    # Almeria - Spain
    elif obj.source[:9] == 'WMO:08489':
        return odim_source.SOURCE["esalm"].encode(UTF8)
    # Spain - Sierra de Fuentes, a k a Badajoz
    elif obj.source[:9] == "WMO:08262":
        return odim_source.SOURCE["esbad"].encode(UTF8)
    # Spain - Autilla Pino, a k a Valladolid
    elif obj.source[:9] == "WMO:08262":
        return odim_source.SOURCE["eslid"].encode(UTF8)
    # Spain - Aguion, a k a Santander
    elif obj.source[:9] == "WMO:08019":
        return odim_source.SOURCE["essan"].encode(UTF8)
    # Jersey
    elif obj.source == 'WMO:00897':
        return odim_source.SOURCE["ukjer"].encode(UTF8)
    # Keflavik
    elif obj.source == 'WMO:0,PLC:Keflavik':
        obj.height = 45.0
        return odim_source.SOURCE["iskef"].encode(UTF8)
    # Dublin
    elif obj.source == 'WMO:03696':
        return odim_source.SOURCE["iedub"].encode(UTF8)
    # Essen
    elif obj.source == 'WMO:10412':
        return odim_source.SOURCE["deess"].encode(UTF8)
    # KNMI:
    elif len(source.split(";")) == 2 or source[:6] == "RAD:NL":
        #source = re.sub(";", ",", source)  # no longer needed
        source = re.sub("PLC", "NOD", source)
        s = odim_source.ODIM_Source(source)
        return odim_source.SOURCE[s.nod].encode(UTF8)
    # met.no
    elif re.search("1438", obj.source):
        return odim_source.SOURCE["nohgb"].encode(UTF8)
    elif re.search("1104", obj.source):
        return odim_source.SOURCE["norst"].encode(UTF8)
    elif re.search("1405", obj.source):
        return odim_source.SOURCE["nobml"].encode(UTF8)
    elif obj.source == 'WMO:01079,NOD:nober,PLC:Berlev\xe5g':
        return odim_source.SOURCE["nober"].encode(UTF8)
    # Serbia
    elif obj.source == "WMO:0,PLC:Samos":
        return odim_source.SOURCE["rssam"].encode(UTF8)
    # Iceland
    elif obj.source == "WMO:0,PLC:Teigsbjarg":
        return odim_source.SOURCE["istgb"].encode(UTF8)


## Manages the conversion of datasets from float64 to uint8.
# @param rio RAVE I/O object
def ConvertDatasets(rio):
    obj = rio.object
    if rio.objectType == _raveio.Rave_ObjectType_SCAN:
        dbzh = obj.getParameter("DBZH")
        ConvertParam(dbzh)
    else:
        for i in range(obj.getNumberOfScans()):
            scan = obj.getScan(i)
            dbzh = scan.getParameter("DBZH")
            ConvertParam(dbzh)


## Converts 64-bit float to 8-bit uint, with standard scaling
# @param param dataset containing physical parameter.
def ConvertParam(param):
    param.gain =     0.5
    param.offset = -32.0
    param.nodata = 255.0
    param.undetect = 0.0
    param.convertDataDoubleToUchar()


## Convenience function for doing the real work in \ref CheckOddsnEnds
# @param scan polar scan object
def CheckScan(scan):
    if (scan.nbins * scan.rscale / 1000) < scan.rstart:
        scan.rstart /= 1000.0
    if scan.rscale < 10.0: scan.rscale *= 1000  # Idiot test
    if scan.hasParameter("TH") and not scan.hasParameter("DBZH"):
        dbzh = scan.getParameter("TH")
        dbzh.quantity = "DBZH"
        scan.removeParameter("TH")
        scan.addParameter(dbzh)
    else:
        dbzh = scan.getParameter("DBZH")
    ConvertNodataUndetect(dbzh)


## Manages the standardization of selected data and metadata attributes.
# @param obj input RAVE I/O object.
def CheckOddsnEnds(rio):
    obj = rio.object
    if rio.objectType == _raveio.Rave_ObjectType_SCAN:
        CheckScan(obj)
    else:
        for i in range(obj.getNumberOfScans()):
            scan = obj.getScan(i)
            CheckScan(scan)


## Checks and converts nodata and undetect to standard values.
# Required by Ropo, not the toolbox.
# @param param physical parameter object.
def ConvertNodataUndetect(param):
    if param.nodata != 255.0:  # This is extremely unlikely
        data = param.getData()
        data = where(equal(data, param.nodata), 255, data)
        param.nodata = 255.0
        param.setData(data)
    if param.undetect != 0.0:  # This is much more likely
        data = param.getData()
        data = where(equal(data, param.undetect), 0, data)
        param.undetect = 0.0
        param.setData(data)


if __name__ == "__main__":
    print(__doc__)
