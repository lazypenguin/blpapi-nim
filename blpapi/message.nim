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
# blpapi_message.h                                                   -*-C++-*-

#@PURPOSE: Defines a message containing elements.
#
#@CLASSES:
# blpapi::Message: individual message inside an event.
#
#@SEE_ALSO: blpapi_event
#
#@DESCRIPTION: This file defines a 'Message'. A 'Message' is contained in an
# 'Event' and contains 'Element's.
include blpapi.dll

import correlationid 
import defs 
import element 
import service 
import timepoint 
import types

type
  Message* = object
  
  Message_t* = Message

proc Message_messageType*(message: ptr Message_t): ptr Name_t {.cdecl,
    importc: "blpapi_Message_messageType", dynlib: blpapi_lib.}
proc Message_typeString*(message: ptr Message_t): cstring {.cdecl,
    importc: "blpapi_Message_typeString", dynlib: blpapi_lib.}
proc Message_topicName*(message: ptr Message_t): cstring {.cdecl,
    importc: "blpapi_Message_topicName", dynlib: blpapi_lib.}
proc Message_service*(message: ptr Message_t): ptr Service_t {.cdecl,
    importc: "blpapi_Message_service", dynlib: blpapi_lib.}
proc Message_numCorrelationIds*(message: ptr Message_t): cint {.cdecl,
    importc: "blpapi_Message_numCorrelationIds", dynlib: blpapi_lib.}
proc Message_correlationId*(message: ptr Message_t; index: csize): CorrelationId_t {.
    cdecl, importc: "blpapi_Message_correlationId", dynlib: blpapi_lib.}
proc Message_elements*(message: ptr Message_t): ptr Element_t {.cdecl,
    importc: "blpapi_Message_elements", dynlib: blpapi_lib.}
proc Message_privateData*(message: ptr Message_t; size: ptr csize): cstring {.cdecl,
    importc: "blpapi_Message_privateData", dynlib: blpapi_lib.}
proc Message_fragmentType*(message: ptr Message_t): cint {.cdecl,
    importc: "blpapi_Message_fragmentType", dynlib: blpapi_lib.}
proc Message_addRef*(message: ptr Message_t): cint {.cdecl,
    importc: "blpapi_Message_addRef", dynlib: blpapi_lib.}
proc Message_release*(message: ptr Message_t): cint {.cdecl,
    importc: "blpapi_Message_release", dynlib: blpapi_lib.}
proc Message_timeReceived*(message: ptr Message_t; timeReceived: ptr TimePoint_t): cint {.
    cdecl, importc: "blpapi_Message_timeReceived", dynlib: blpapi_lib.}