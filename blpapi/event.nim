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
# blpapi_event.h                                                     -*-C++-*-

#@PURPOSE: A component which defines events related operations
#
#@CLASSES:
#            blpapi::Event: an event resulting from a subscription or request.
#       blpapi::EventQueue: A construct to handle replies synchronously.
#  blpapi::MessageIterator: An iterator over the Messages within an Event.
#
#@DESCRIPTION: This file defines an 'Event'. One or more 'Event's are
# generated as a result of a subscription or a request. Events contain Message
# objects which can be accessed using a 'MessageIterator'. This file also
# defines a 'EventQueue' for handling replies synchronously.
#
#/Usage
#/-----
# The following code snippet shows a how a 'EventQueue' is used with a
# 'generateToken' request. For any established session 'session' pass an
# 'EventQueue' object 'tokenEventQueue' when calling 'generateToken'.
# All Events in responses to 'generateToken' request will be returned in
# 'tokenEventQueue'.
#..
# //...
# EventQueue tokenEventQueue;
# session->generateToken(CorrelationId(), &tokenEventQueue);
#..
# Synchronously read the response 'event' and parse over messages using 'iter'
#..
# Event event = tokenEventQueue.nextEvent();
# if (event.eventType() == Event::TOKEN_STATUS) {
#     MessageIterator iter(event);
#     while (iter.next()) {
#         Message msg = iter.message();
#         //...
#..
include blpapi.dll 

import message 
import defs 
import types 

proc Event_eventType*(event: ptr Event_t): cint {.cdecl,
    importc: "blpapi_Event_eventType", dynlib: blpapi_lib.}
proc Event_addRef*(event: ptr Event_t): cint {.cdecl, importc: "blpapi_Event_addRef",
    dynlib: blpapi_lib.}
proc Event_release*(event: ptr Event_t): cint {.cdecl,
    importc: "blpapi_Event_release", dynlib: blpapi_lib.}
proc EventQueue_create*(): ptr EventQueue_t {.cdecl,
    importc: "blpapi_EventQueue_create", dynlib: blpapi_lib.}
proc EventQueue_destroy*(eventQueue: ptr EventQueue_t): cint {.cdecl,
    importc: "blpapi_EventQueue_destroy", dynlib: blpapi_lib.}
proc EventQueue_nextEvent*(eventQueue: ptr EventQueue_t; timeout: cint): ptr Event_t {.
    cdecl, importc: "blpapi_EventQueue_nextEvent", dynlib: blpapi_lib.}
proc EventQueue_purge*(eventQueue: ptr EventQueue_t): cint {.cdecl,
    importc: "blpapi_EventQueue_purge", dynlib: blpapi_lib.}
proc EventQueue_tryNextEvent*(eventQueue: ptr EventQueue_t;
                             eventPointer: ptr ptr Event_t): cint {.cdecl,
    importc: "blpapi_EventQueue_tryNextEvent", dynlib: blpapi_lib.}
proc MessageIterator_create*(event: ptr Event_t): ptr MessageIterator_t {.cdecl,
    importc: "blpapi_MessageIterator_create", dynlib: blpapi_lib.}
proc MessageIterator_destroy*(`iterator`: ptr MessageIterator_t) {.cdecl,
    importc: "blpapi_MessageIterator_destroy", dynlib: blpapi_lib.}
proc MessageIterator_next*(`iterator`: ptr MessageIterator_t;
                          result: ptr ptr Message_t): cint {.cdecl,
    importc: "blpapi_MessageIterator_next", dynlib: blpapi_lib.}