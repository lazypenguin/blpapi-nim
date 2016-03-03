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
# blpapi_topic.h                                                     -*-C++-*-

#@PURPOSE: Provide representation of a Topic
#
#@CLASSES:
# blpapi::Topic: Represents a Topic
#
#@DESCRIPTION: This component provides a topic that is used for publishing
# data on.
include blpapi.dll 

import defs
import service 
import types 

type
  Topic* = object
  
  Topic_t* = Topic

proc Topic_create*(`from`: ptr Topic_t): ptr Topic_t {.cdecl,
    importc: "blpapi_Topic_create", dynlib: blpapi_lib.}
proc Topic_destroy*(victim: ptr Topic_t) {.cdecl, importc: "blpapi_Topic_destroy",
                                       dynlib: blpapi_lib.}
proc Topic_compare*(lhs: ptr Topic_t; rhs: ptr Topic_t): cint {.cdecl,
    importc: "blpapi_Topic_compare", dynlib: blpapi_lib.}
proc Topic_service*(topic: ptr Topic_t): ptr Service_t {.cdecl,
    importc: "blpapi_Topic_service", dynlib: blpapi_lib.}
proc Topic_isActive*(topic: ptr Topic_t): cint {.cdecl,
    importc: "blpapi_Topic_isActive", dynlib: blpapi_lib.}