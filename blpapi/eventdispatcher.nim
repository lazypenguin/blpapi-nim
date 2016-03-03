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
# blpapi_eventdispatcher.h                                           -*-C++-*-

#@PURPOSE: Provide a dispatcher to dispatch events.
#
#@CLASSES:
# blpapi::EventDispatcher: Dispatches events from one or more Sessions through
# callbacks
#
#@DESCRIPTION: This component implements a dispatcher to dispatch events from
# one or more 'Session' through callbacks.
include blpapi.dll

import defs 
import types 

proc EventDispatcher_create*(numDispatcherThreads: csize): ptr EventDispatcher_t {.
    cdecl, importc: "blpapi_EventDispatcher_create", dynlib: blpapi_lib.}
proc EventDispatcher_destroy*(handle: ptr EventDispatcher_t) {.cdecl,
    importc: "blpapi_EventDispatcher_destroy", dynlib: blpapi_lib.}
proc EventDispatcher_start*(handle: ptr EventDispatcher_t): cint {.cdecl,
    importc: "blpapi_EventDispatcher_start", dynlib: blpapi_lib.}
proc EventDispatcher_stop*(handle: ptr EventDispatcher_t; async: cint): cint {.cdecl,
    importc: "blpapi_EventDispatcher_stop", dynlib: blpapi_lib.}
proc EventDispatcher_dispatchEvents*(handle: ptr EventDispatcher_t): cint {.cdecl,
    importc: "blpapi_EventDispatcher_dispatchEvents", dynlib: blpapi_lib.}