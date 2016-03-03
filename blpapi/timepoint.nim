# Copyright 2012. Bloomberg Finance L.P.
# 
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to
#  deal in the Software without restriction, including without limitation the
#  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
#  sell copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:  The above
#  copyright notice and this permission notice shall be included in all copies
#  or substantial portions of the Software.
# 
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
#  IN THE SOFTWARE.
# 
# blpapi_timepoint.h                                                 -*-C++-*-

#@PURPOSE: Provide a time point with respect to an epoch
#
#@CLASSES:
# blpapi::TimePoint: a fixed moment in a linear model of time
# blpapi::TimePointUtil: namespace for 'TimePoint' Utility functions
#
#@SEE_ALSO: blpapi_highresolutionclock, blpapi_datetime
#
#@DESCRIPTION: This component provides a representation of a fixed moment in
# a strict linear model of time. A function to measure the distance between
# two such moments is provided. Note that such a moment is not associated
# with any particular calendar or wall-clock conventions---see
# 'blpapi_datetime' for such representations (and for functions to apply such
# conventions to an existing time point).
include blpapi.dll

import defs
import types 

type
  TimePoint* = object
    d_value*: Int64_t # This struct provides an *in-core* *value* *semantic* type for
                    # representing a single moment in time, assuming a simple linear model of
                    # time. The precision of such representations is guaranteed to be at
                    # least at the granularity of nanoseconds, but only times relatively near
                    # (within a few years of) the current moment are guaranteed to be
                    # representable. The actual implementation of a time point is
                    # implementation-defined and opaque to client code; in particular, time
                    # points can *not* be transferred between processes. (The SDK reserves
                    # the right to alter the epoch used as a base from run to run.) Clients
                    # wishing to persist time points should use the
                    # 'TimePointUtil::nanosecondsBetween' function to measure distance from a
                    # known epoch value, or convert the time point to some standard calendar
                    # and wall-clock convention (e.g. 'blpapi::Datetime').
  
  TimePoint_t* = TimePoint

proc TimePointUtil_nanosecondsBetween*(start: ptr TimePoint_t;
                                      `end`: ptr TimePoint_t): clonglong {.cdecl,
    importc: "blpapi_TimePointUtil_nanosecondsBetween", dynlib: blpapi_lib.}
# Return the difference between 'start' and 'end' 'TimePoint' objects. The
# returned value is in nanoseconds representing 'end - start'.
