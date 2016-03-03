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
# blpapi_topiclist.h                                                 -*-C++-*-

#@PURPOSE: Provide a representation of a list of topics.
#
#@CLASSES:
# blpapi::TopicList: Represents a list of topics
#
#@DESCRIPTION: This component implements a list of topics which require
# topic creation.
include blpapi.dll

import types
import correlationid
import defs
import element
import name
import message 
import resolutionlist

type
  TopicList* = object
  TopicList_t* = TopicList

proc TopicList_create*(`from`: ptr TopicList_t): ptr TopicList_t {.cdecl,
    importc: "blpapi_TopicList_create", dynlib: blpapi_lib.}
proc TopicList_destroy*(list: ptr TopicList_t) {.cdecl,
    importc: "blpapi_TopicList_destroy", dynlib: blpapi_lib.}
proc TopicList_add*(list: ptr TopicList_t; topic: cstring;
                   correlationId: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_TopicList_add", dynlib: blpapi_lib.}
proc TopicList_addFromMessage*(list: ptr TopicList_t; topic: ptr Message_t;
                              correlationId: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_TopicList_addFromMessage", dynlib: blpapi_lib.}
proc TopicList_correlationIdAt*(list: ptr TopicList_t; result: ptr CorrelationId_t;
                               index: csize): cint {.cdecl,
    importc: "blpapi_TopicList_correlationIdAt", dynlib: blpapi_lib.}
proc TopicList_topicString*(list: ptr TopicList_t; topic: cstringArray;
                           id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_TopicList_topicString", dynlib: blpapi_lib.}
proc TopicList_topicStringAt*(list: ptr TopicList_t; topic: cstringArray; index: csize): cint {.
    cdecl, importc: "blpapi_TopicList_topicStringAt", dynlib: blpapi_lib.}
proc TopicList_status*(list: ptr TopicList_t; status: ptr cint; id: ptr CorrelationId_t): cint {.
    cdecl, importc: "blpapi_TopicList_status", dynlib: blpapi_lib.}
proc TopicList_statusAt*(list: ptr TopicList_t; status: ptr cint; index: csize): cint {.
    cdecl, importc: "blpapi_TopicList_statusAt", dynlib: blpapi_lib.}
proc TopicList_message*(list: ptr TopicList_t; element: ptr ptr Message_t;
                       id: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_TopicList_message", dynlib: blpapi_lib.}
proc TopicList_messageAt*(list: ptr TopicList_t; element: ptr ptr Message_t;
                         index: csize): cint {.cdecl,
    importc: "blpapi_TopicList_messageAt", dynlib: blpapi_lib.}
proc TopicList_size*(list: ptr TopicList_t): cint {.cdecl,
    importc: "blpapi_TopicList_size", dynlib: blpapi_lib.}