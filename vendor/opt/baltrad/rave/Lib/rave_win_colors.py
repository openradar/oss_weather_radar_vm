#!/usr/bin/env python
# -*- coding: latin-1 -*-
#
# $Id: rave_win_colors.py,v 1.1.1.1 2006/07/14 11:31:54 dmichels Exp $
#
# Author: Daniel Michelson
#
# Copyright (c): Swedish Meteorological and Hydrological Institute
#                2005-
#                All rights reserved.
#
# $Log: rave_win_colors.py,v $
# Revision 1.1.1.1  2006/07/14 11:31:54  dmichels
# Project added under CVS
#
#
"""
rave_win_colors.py - Color palettes for visualization one way or the other.
"""
import string
from rave_defines import *
import numpy

#DEFINES
ZERO = numpy.zeros(256).astype('B')
HALF = (numpy.zeros(256)+128).astype('B')
MAX = (numpy.zeros(256)+255).astype('B')
ASC = numpy.arange(256).astype('B')  # ascending levels
DESC = numpy.arange(255,-1,-1).astype('B')  # descending levels
BLACK      = [(  0,  0,  0)]
DARKBLUE   = [(  0,  0,128)]
BLUE       = [(  0,  0,255)]
CYAN       = [(  0,255,255)]
DARKGREEN  = [(  0,128,  0)]
GREEN      = [(  0,255,  0)]
DARKYELLOW = [(128,128,  0)]
YELLOW     = [(255,255,  0)]
ORANGE     = [(255,128,  0)]
DARKRED    = [(128,  0,  0)]
RED        = [(255,  0,  0)]
PINK       = [(255,  0,128)]
MAGENTA    = [(255,  0,255)]
PUREWHITE  = [(255,255,255)]
GREY1      = [( 21, 21, 21)]
GREY2      = [( 42, 42, 42)]
GREY3      = [( 63, 63, 63)]
GREY4      = [( 84, 84, 84)]
GREY5      = [(105,105,105)]
GREY6      = [(126,126,126)]
GREY7      = [(147,147,147)]
GREY8      = [(168,168,168)]
GREY9      = [(189,189,189)]
GREY10     = [(210,210,210)]
GREY11     = [(231,231,231)]
GREY12     = [(252,252,252)]


def get_255_colors(rimg):
    retdata=numpy.array(rimg.data)
    if retdata.dtype.char != 'B':
#    if retdata.typecode() != 'b':  # relic from Numeric
        MIN = numpy.minimum.reduce(retdata.flat)
        if MIN < 0:
            retdata = retdata + abs(MIN)
        MIN = numpy.minimum.reduce(retdata.flat)
        MAX = numpy.maximum.reduce(retdata.flat)
        spread = float(MAX-MIN)
        retdata = ((1 - ((MAX - retdata) / spread)) * 255).astype('B')
    return retdata

def GetColours(r, g, b, INTERVAL, half=None):
    if half != None: half = 128
    else: half = 255
    p = []
    here = 0
    for i in range(0, half, INTERVAL):
        p.append((r[here],g[here],b[here]))
        here = here + INTERVAL
    return p

def torgb(r,g,b):
    a = numpy.array([r,g,b], 'B')
    t = numpy.transpose(a).astype('B').tolist()
    rgb = []
    for l in t:
        #print "L="+`l`
        #rgb = rgb + l
        rgb.append(tuple(l))
    #print "RGB="+`rgb`
    return rgb

def zero(interval, plus=None):
    l = len(list(range(0,255,interval)))
    if plus == None:
        return numpy.zeros(l, 'B')
    else:
        return (numpy.zeros(l)+plus).astype('B')

def zeromax(interval):
    return list(range(0,255,interval))

def zerohalf(interval):
    return list(range(0,128,interval))

def halfmax(interval):
    return list(range(128,255,interval))

def maxhalf(interval):
    return list(range(255,128,-interval))

def halfzero(interval):
    return list(range(128,0,-interval))

def maxzero(interval):
    return list(range(255, 0,-interval))

# even newer continuous dBZ. Compactly incomprehensible!
def continuous_dbz():
    p=3*BLACK
    #p.append(tuple(3 * BLACK))
    p = p + torgb(zero(8),      zero(8),     zeromax(8)) # blues
    p = p + torgb(zero(12),     zeromax(12), zero(12,255)) # cyan
    p = p + torgb(zero(12),     maxhalf(6),  maxzero(12)) # darkgreen
    p = p + torgb(zero(12),     halfmax(6),  zero(12)) # green
    p = p + torgb(zerohalf(6),  maxhalf(6),  zero(12)) # dark yellow
    p = p + torgb(halfmax(6),   halfmax(6),  zero(12)) # yellow
    p = p + torgb(zero(12,255), maxhalf(6),  zero(12)) # orange
    p = p + torgb(maxhalf(6),   halfzero(6), zero(12)) # dark red
    p = p + torgb(halfmax(6),   zero(12),    zero(12)) # red
    p = p + torgb(zero(12,255), zero(12),    zerohalf(6)) # pink
    p = p + torgb(zero(12,255), zero(12),    halfmax(6)) # magenta
    return p+PUREWHITE

def GetIntervals(GAIN, OFFSET):
    intervals = []
    for i in range(-30, 91, 10):
        raw = int(round((i - OFFSET) / GAIN, 0))
        intervals.append(raw)
    return intervals

# continuous raw greyscale palette
def continuous_raw():
    p = GetColours(ASC, ASC, ASC, 1)
    return p + PUREWHITE

# discrete raw greyscale
def discrete_raw(GAIN, OFFSET):
    firstintervals = GetIntervals(GAIN, OFFSET)
    intervals = []
    for i in firstintervals:
        if 0 <= i < 255: 
            intervals.append(i)
    p = BLACK
    for i in range(len(intervals)):
        if i == 0:
            for j in range(intervals[1]):
                p = p + GREY1
        elif i == len(intervals)-1:
            if intervals[i] < 255:
                for j in range(255-intervals[i]):
                    p = p + PUREWHITE
            else:
                raise ValueError("palette level beyond 255")
        else:
            for j in range(intervals[i+1]-intervals[i]):
                if i == 1: p = p + GREY2
                elif i == 2: p = p + GREY3
                elif i == 3: p = p + GREY4
                elif i == 4: p = p + GREY5
                elif i == 5: p = p + GREY6
                elif i == 6: p = p + GREY7
                elif i == 7: p = p + GREY8
                elif i == 8: p = p + GREY9
                elif i == 9: p = p + GREY10
                elif i == 10: p = p + GREY11
                elif i == 11: p = p + GREY12
    return p

# discrete dBZ. Requires linear transform coefficients.
def disc_dbz(GAIN, OFFSET):
    firstintervals = GetIntervals(GAIN, OFFSET)
    intervals = []
    for i in firstintervals:
        if 0 <= i < 255: 
            intervals.append(i)
    p = BLACK
    for i in range(len(intervals)):
        if i == 0:
            for j in range(intervals[1]):
                p = p + DARKBLUE
        elif i == len(intervals)-1:
            if intervals[i] < 255:
                for j in range(255-intervals[i]):
                    p = p + PUREWHITE
            else:
                raise ValueError("palette level beyond 255")
        else:
            for j in range(intervals[i+1]-intervals[i]):
                if i == 1: p = p + BLUE
                elif i == 2: p = p + CYAN
                elif i == 3: p = p + DARKGREEN
                elif i == 4: p = p + GREEN
                elif i == 5: p = p + DARKYELLOW
                elif i == 6: p = p + YELLOW
                elif i == 7: p = p + ORANGE
                elif i == 8: p = p + DARKRED
                elif i == 9: p = p + RED
                elif i == 10: p = p + PINK
                elif i == 11: p = p + MAGENTA
    return p


# discrete m/s palette, tailored to Swedish linear transform coefficients.
# t is towards, a is away. Assumes t is negative.
def discrete_ms():
    t6 = 21 * DARKBLUE   # 1-21,    -40-48
    t5 = 21 * BLUE       # 22-42,   -32-40
    t4 = 22 * CYAN       # 43-64,   -24-32
    t3 = 21 * DARKGREEN  # 65-85,   -16-24
    t2 = 21 * GREEN      # 86-106,  - 8-16
    t1 = 18 * DARKYELLOW # 107-124, - 1.5-8
    z  =  7 * PUREWHITE  # 125-131, +- 1.5
    a1 = 18 * YELLOW     # 132-149,   1.5-8
    a2 = 21 * ORANGE     # 150-170,   8-16
    a3 = 21 * DARKRED    # 171-191,  16-24
    a4 = 22 * RED        # 192-213,  24-32
    a5 = 21 * PINK       # 214-234,  32-40
    a6 = 20 * MAGENTA    # 235-254,  40-48+
    return BLACK+t6+t5+t4+t3+t2+t1+z+a1+a2+a3+a4+a5+a6+PUREWHITE

# continuous m/s palette, modelled after continuous_dbz. Not very pretty...
def continuous_ms():
    p = continuous_dbz()
    #p[126*3:130*3] = 4 * PUREWHITE
    p[126:130]=4*PUREWHITE
    return p

# discrete ff_dev.
def disc_ff_dev():
    return BLACK+41*BLUE+42*CYAN+42*GREEN+42*YELLOW+42*RED+45*MAGENTA+PUREWHITE

def discrete_mm():
    return BLACK + 20*DARKBLUE + 20*BLUE + 20*CYAN + 20*DARKGREEN + \
           20*GREEN + 20*DARKYELLOW + 20*YELLOW + 20*ORANGE + 20*DARKRED + \
           20*RED + 20*MAGENTA + 35*PUREWHITE


class color_map:
    _color_maps={}
    def __init__(self,ltype,colors=None,descr=None):
        if not ltype in self._color_maps:
            self.icolor=colors
            self.idescr=descr
            self._color_maps[ltype]=self
            self._ltype=ltype

    def color(self,**kw):
        return self.icolor

    def description(self,**kw):
        if self.idescr!=None:
            return self.idescr

        intervals=[]
        OFFSET=kw["OFFSET"]
        GAIN=kw["GAIN"]

        # radial wind velocity gets special treatment
        if GAIN == 0.375 and int(OFFSET) == -48:
            for i in range(-48,49,8):
                raw = int(round((i - OFFSET) / GAIN, 0))
                if raw<260:
                    intervals.append((raw,string.rjust(repr(i),4)))
        else:
            for i in range(-30, 91, 10):
                raw = int(round((i - OFFSET) / GAIN, 0))
                if raw<256:
                    intervals.append((raw,string.rjust(repr(i),4)))
        return intervals

    def options(self,**kw):
        return {}

class slope_map(color_map):
    _slope_ord_map=[]

    def __init__(self,ltype):
        color_map.__init__(*(self,ltype))

    def color(self,**kw):
        intervals=[]
        OFFSET=kw["OFFSET"]
        GAIN=kw["GAIN"]

        stup=(self._ltype,OFFSET,GAIN)
        for i in self._slope_ord_map:
            if stup==i[0]:
                return i[1]

        intervals=self._get_interval(GAIN,OFFSET)

        self._slope_ord_map.append((stup,intervals))

        return intervals

    def _get_interval(self,GAIN,OFFSET):
        raise AttributeError("Calling _get_interval in baseclass slope_map")


class discrete_raw_slope(slope_map):
    def __init__(self):
        slope_map.__init__(*(self,"discrete_raw"))

    def _get_interval(self,GAIN,OFFSET):
        return discrete_raw(GAIN,OFFSET)

class discrete_dbz_slope(slope_map):
    def __init__(self):
        slope_map.__init__(*(self,"discrete_dbz"))

    def _get_interval(self,GAIN,OFFSET):
        return disc_dbz(GAIN,OFFSET)

class wind_profile(color_map):
    def __init__(self):
        color_map.__init__(*(self,"wind_profile",disc_ff_dev()))
        self.init_description()

    def init_description(self):
        self.mydescr=[]
        #j=0
        #for i in range(0,300,50):
        #    self.mydescr.append((i,`i/100.0`))
        self.mydescr.append((21,'0 kts'))
        self.mydescr.append((63,'1'))
        self.mydescr.append((105,'2'))
        self.mydescr.append((147,'3'))
        self.mydescr.append((189,'4'))
        self.mydescr.append((231,'5 kts'))

    def description(self,**kw):
        return self.mydescr

    def options(self,**kw):
        return {'anchor':'w'}

class radial_wind_velocity(color_map):
    def __init__(self):
        color_map.__init__(*(self,"radial_wind_velocity",discrete_ms()))
        self.init_description()

    def init_description(self):
        self.mydescr=[]
        self.mydescr.append((1,'towards'))
        self.mydescr.append((21,'40'))
        self.mydescr.append((42,'32'))
        self.mydescr.append((64,'24'))
        self.mydescr.append((85,'16'))
        self.mydescr.append((106,'8'))
        self.mydescr.append((127,'0'))
        self.mydescr.append((150,'8'))
        self.mydescr.append((171,'16'))
        self.mydescr.append((192,'24'))
        self.mydescr.append((214,'32'))
        self.mydescr.append((235,'40'))
        self.mydescr.append((254,'away'))

    def description(self,**kw):
        return self.mydescr

    def options(self,**kw):
        return {'anchor':'w'}

class accumulated_mm(color_map):
    def __init__(self):
        color_map.__init__(*(self,"accumulated_mm",discrete_mm()))
        self.init_description()

    def init_description(self):
        self.mydescr=[]
        self.mydescr.append((1,  '    0.1'))
        self.mydescr.append((21, '    0.25'))
        self.mydescr.append((41, '    0.5'))
        self.mydescr.append((61, '    1'))
        self.mydescr.append((81, '    2'))
        self.mydescr.append((101,'    4'))
        self.mydescr.append((121,'    8'))
        self.mydescr.append((141,'   16'))
        self.mydescr.append((161,'   32'))
        self.mydescr.append((181,'   64'))
        self.mydescr.append((201,'  128'))
        self.mydescr.append((221,'  250'))
        self.mydescr.append((254,'> 250'))

    def description(self,**kw):
        return self.mydescr

    def options(self,**kw):
        return {'anchor':'w'}

def get_colors(type):
    return color_map._color_maps[type]

#Register them
color_map("continuous_dbz",continuous_dbz())
color_map("continuous_raw",continuous_raw())
discrete_raw_slope()
discrete_dbz_slope()
color_map("continuous_ms",continuous_ms())
color_map("discrete_ms",discrete_ms())

wind_profile()
radial_wind_velocity()
accumulated_mm()


# Helper function to translate a list of 256 3-tuples to one 768 list.
def to768(p):
    out = []
    for i in p:
        out = out + list(i)
    return out

# 768-length lists for use with PIL and/or rave_ql.py
continuous_dBZ = to768(continuous_dbz())
continuous_RAW = to768(continuous_raw())
discrete_dBZ_SMHI = to768(disc_dbz(0.4, -30))
discrete_dBZ_BLT = to768(disc_dbz(GAIN, OFFSET))
discrete_RAW_SMHI = to768(discrete_raw(0.4, -30))
discrete_RAW_BLT = to768(discrete_raw(GAIN, OFFSET))
discrete_MS = to768(discrete_ms())
continuous_MS = to768(continuous_ms())
discrete_ff_dev = to768(disc_ff_dev())



__all__ = ['__file__']

if __name__ == "__main__":
    print(__doc__)
