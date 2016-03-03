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
# blpapi_datetime.h                                                  -*-C++-*-

#@PURPOSE: Represents a date and/or time.
#
#@CLASSES:
#                blpapi_Datetime_tag: C struct for date and/or msec time
#   blpapi_HighPrecisionDatetime_tag: C struct for date and/or psec time
#                   blpapi::Datetime: C++ class for date and/or psec time
#              blpapi::DatetimeParts: Identifiers for fields within date/time
#               blpapi::DatetimeUtil: 'Datetime' utility functions 
#
#@DESCRIPTION: This file provides a C and C++ data type to represent a
# date and/or time value.
include blpapi.dll

import defs
import exception
import streamproxy
import timepoint 
import types

type
  Datetime_tag* = object
    parts*: UChar_t            # bitmask of date/time parts that are set
    hours*: UChar_t
    minutes*: UChar_t
    seconds*: UChar_t
    milliSeconds*: UInt16_t
    month*: UChar_t
    day*: UChar_t
    year*: UInt16_t
    offset*: Int16_t           # (signed) minutes ahead of UTC
  
  Datetime_t* = Datetime_tag
  HighPrecisionDatetime_tag* = object
    datetime*: Datetime_t
    picoseconds*: UInt32_t     # picosecond offset into current
                         # *millisecond* i.e. the picosecond offset
                         # into the current full second is
                         # '1000000000LL * milliSeconds + picoSeconds'
  
  HighPrecisionDatetime_t* = HighPrecisionDatetime_tag

proc Datetime_compare*(lhs: Datetime_t; rhs: Datetime_t): cint {.cdecl,
    importc: "blpapi_Datetime_compare", dynlib: blpapi_lib.}
proc Datetime_print*(datetime: ptr Datetime_t; streamWriter: StreamWriter_t;
                    stream: pointer; level: cint; spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_Datetime_print", dynlib: blpapi_lib.}
proc HighPrecisionDatetime_compare*(lhs: ptr HighPrecisionDatetime_t;
                                   rhs: ptr HighPrecisionDatetime_t): cint {.cdecl,
    importc: "blpapi_HighPrecisionDatetime_compare", dynlib: blpapi_lib.}
proc HighPrecisionDatetime_print*(datetime: ptr HighPrecisionDatetime_t;
                                 streamWriter: StreamWriter_t; stream: pointer;
                                 level: cint; spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_HighPrecisionDatetime_print", dynlib: blpapi_lib.}
proc HighPrecisionDatetime_fromTimePoint*(datetime: ptr HighPrecisionDatetime_t;
    timePoint: ptr TimePoint_t; offset: cshort): cint {.cdecl,
    importc: "blpapi_HighPrecisionDatetime_fromTimePoint", dynlib: blpapi_lib.}