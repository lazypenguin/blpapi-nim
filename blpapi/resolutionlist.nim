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
# blpapi_resolutionlist.h                                            -*-C++-*-

#@PURPOSE: Provide a representation of a list of topics.
#
#@CLASSES:
# blpapi::ResolutionList: Represents a list of topics
#
#@SEE_ALSO: blpapi_event
#
#@DESCRIPTION: This component implements a list of topics that require
# resolution.
include blpapi.dll

import types
import correlationid 
import defs 
import element 
import message 

type
  ResolutionList* = object
  
  ResolutionList_t* = ResolutionList

proc ResolutionList_extractAttributeFromResolutionSuccess*(
    message: ptr Message_t; attribute: ptr Name_t): ptr Element_t {.cdecl,
    importc: "blpapi_ResolutionList_extractAttributeFromResolutionSuccess",
    dynlib: blpapi_lib.}
proc ResolutionList_create*(`from`: ptr ResolutionList_t): ptr ResolutionList_t {.
    cdecl, importc: "blpapi_ResolutionList_create", dynlib: blpapi_lib.}
proc ResolutionList_destroy*(list: ptr ResolutionList_t) {.cdecl,
    importc: "blpapi_ResolutionList_destroy", dynlib: blpapi_lib.}
proc ResolutionList_add*(list: ptr ResolutionList_t; topic: cstring;
                        correlationId: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_add", dynlib: blpapi_lib.}
proc ResolutionList_addFromMessage*(list: ptr ResolutionList_t;
                                   topic: ptr Message_t;
                                   correlationId: ptr CorrelationId_t): cint {.
    cdecl, importc: "blpapi_ResolutionList_addFromMessage", dynlib: blpapi_lib.}
proc ResolutionList_addAttribute*(list: ptr ResolutionList_t; name: ptr Name_t): cint {.
    cdecl, importc: "blpapi_ResolutionList_addAttribute", dynlib: blpapi_lib.}
proc ResolutionList_correlationIdAt*(list: ptr ResolutionList_t;
                                    result: ptr CorrelationId_t; index: csize): cint {.
    cdecl, importc: "blpapi_ResolutionList_correlationIdAt", dynlib: blpapi_lib.}
proc ResolutionList_topicString*(list: ptr ResolutionList_t; topic: cstringArray;
                                id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_topicString", dynlib: blpapi_lib.}
proc ResolutionList_topicStringAt*(list: ptr ResolutionList_t; topic: cstringArray;
                                  index: csize): cint {.cdecl,
    importc: "blpapi_ResolutionList_topicStringAt", dynlib: blpapi_lib.}
proc ResolutionList_status*(list: ptr ResolutionList_t; status: ptr cint;
                           id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_status", dynlib: blpapi_lib.}
proc ResolutionList_statusAt*(list: ptr ResolutionList_t; status: ptr cint;
                             index: csize): cint {.cdecl,
    importc: "blpapi_ResolutionList_statusAt", dynlib: blpapi_lib.}
proc ResolutionList_attribute*(list: ptr ResolutionList_t;
                              element: ptr ptr Element_t; attribute: ptr Name_t;
                              id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_attribute", dynlib: blpapi_lib.}
proc ResolutionList_attributeAt*(list: ptr ResolutionList_t;
                                element: ptr ptr Element_t; attribute: ptr Name_t;
                                index: csize): cint {.cdecl,
    importc: "blpapi_ResolutionList_attributeAt", dynlib: blpapi_lib.}
proc ResolutionList_message*(list: ptr ResolutionList_t; element: ptr ptr Message_t;
                            id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_message", dynlib: blpapi_lib.}
proc ResolutionList_messageAt*(list: ptr ResolutionList_t;
                              element: ptr ptr Message_t; index: csize): cint {.cdecl,
    importc: "blpapi_ResolutionList_messageAt", dynlib: blpapi_lib.}
proc ResolutionList_size*(list: ptr ResolutionList_t): cint {.cdecl,
    importc: "blpapi_ResolutionList_size", dynlib: blpapi_lib.}