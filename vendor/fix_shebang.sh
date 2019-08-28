#!/bin/sh
###########################################################################
# Copyright (C) 2012 Swedish Meteorological and Hydrological Institute, SMHI,
#
# This file is part of RAVE.
#
# RAVE is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# RAVE is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with RAVE.  If not, see <http://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------
# 
# Fixes the shebang line in the python scripts
# @file
# @author Anders Henja (Swedish Meteorological and Hydrological Institute, SMHI)
# @date 2018-04-01
############################################################################

if [ $# -ne 3 ]; then
  echo "Must specify <python binary> <file to be modifed> <full path to installation>"
  exit 127
fi

cat $2 | sed -e '1s|\/usr\/bin\/env python|'$1'|' > "$3/$2"

chmod 755 "$3/$2"
echo "Copied $2 => $3/$2"

