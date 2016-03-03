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
# blpapi_session.h                                                   -*-C++-*-

#@PURPOSE: Provide consumer session to get Bloomberg Service.
#
#@CLASSES:
# blpapi::Session: A consumer session for consuming service
#
#@DESCRIPTION: This component implements a consumer session for getting
# services.
include blpapi.dll

import abstractsession 
import correlationid 
import defs 
import event 
import eventdispatcher 
import identity 
import request 
import service 
import sessionoptions 
import subscriptionlist 
import types 

type
  EventHandler_t* = proc (event: ptr Event_t; session: ptr Session_t; userData: pointer) {.
      cdecl.}

proc Session_create*(parameters: ptr SessionOptions_t; handler: EventHandler_t;
                    dispatcher: ptr EventDispatcher_t; userData: pointer): ptr Session_t {.
    cdecl, importc: "blpapi_Session_create", dynlib: blpapi_lib.}
proc Session_destroy*(session: ptr Session_t) {.cdecl,
    importc: "blpapi_Session_destroy", dynlib: blpapi_lib.}
proc Session_start*(session: ptr Session_t): cint {.cdecl,
    importc: "blpapi_Session_start", dynlib: blpapi_lib.}
proc Session_startAsync*(session: ptr Session_t): cint {.cdecl,
    importc: "blpapi_Session_startAsync", dynlib: blpapi_lib.}
proc Session_stop*(session: ptr Session_t): cint {.cdecl,
    importc: "blpapi_Session_stop", dynlib: blpapi_lib.}
proc Session_stopAsync*(session: ptr Session_t): cint {.cdecl,
    importc: "blpapi_Session_stopAsync", dynlib: blpapi_lib.}
proc Session_nextEvent*(session: ptr Session_t; eventPointer: ptr ptr Event_t;
                       timeoutInMilliseconds: cuint): cint {.cdecl,
    importc: "blpapi_Session_nextEvent", dynlib: blpapi_lib.}
proc Session_tryNextEvent*(session: ptr Session_t; eventPointer: ptr ptr Event_t): cint {.
    cdecl, importc: "blpapi_Session_tryNextEvent", dynlib: blpapi_lib.}
proc Session_subscribe*(session: ptr Session_t;
                       subscriptionList: ptr SubscriptionList_t;
                       handle: ptr Identity_t; requestLabel: cstring;
                       requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_subscribe", dynlib: blpapi_lib.}
proc Session_resubscribe*(session: ptr Session_t;
                         resubscriptionList: ptr SubscriptionList_t;
                         requestLabel: cstring; requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_resubscribe", dynlib: blpapi_lib.}
proc Session_resubscribeWithId*(session: ptr Session_t;
                               resubscriptionList: ptr SubscriptionList_t;
                               resubscriptionId: cint; requestLabel: cstring;
                               requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_resubscribeWithId", dynlib: blpapi_lib.}
proc Session_unsubscribe*(session: ptr Session_t;
                         unsubscriptionList: ptr SubscriptionList_t;
                         requestLabel: cstring; requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_unsubscribe", dynlib: blpapi_lib.}
proc Session_cancel*(session: ptr Session_t; correlationIds: ptr CorrelationId_t;
                    numCorrelationIds: csize; requestLabel: cstring;
                    requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_cancel", dynlib: blpapi_lib.}
proc Session_setStatusCorrelationId*(session: ptr Session_t; service: ptr Service_t;
                                    identity: ptr Identity_t;
                                    correlationId: ptr CorrelationId_t): cint {.
    cdecl, importc: "blpapi_Session_setStatusCorrelationId", dynlib: blpapi_lib.}
proc Session_sendRequest*(session: ptr Session_t; request: ptr Request_t;
                         correlationId: ptr CorrelationId_t;
                         identity: ptr Identity_t; eventQueue: ptr EventQueue_t;
                         requestLabel: cstring; requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_Session_sendRequest", dynlib: blpapi_lib.}
proc Session_sendAuthorizationRequest*(session: ptr Session_t;
                                      request: ptr Request_t;
                                      identity: ptr Identity_t;
                                      correlationId: ptr CorrelationId_t;
                                      eventQueue: ptr EventQueue_t;
                                      requestLabel: cstring; requestLabelLen: cint): cint {.
    cdecl, importc: "blpapi_Session_sendAuthorizationRequest", dynlib: blpapi_lib.}
proc Session_openService*(session: ptr Session_t; serviceName: cstring): cint {.cdecl,
    importc: "blpapi_Session_openService", dynlib: blpapi_lib.}
proc Session_openServiceAsync*(session: ptr Session_t; serviceName: cstring;
                              correlationId: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_Session_openServiceAsync", dynlib: blpapi_lib.}
proc Session_generateToken*(session: ptr Session_t;
                           correlationId: ptr CorrelationId_t;
                           eventQueue: ptr EventQueue_t): cint {.cdecl,
    importc: "blpapi_Session_generateToken", dynlib: blpapi_lib.}
proc Session_getService*(session: ptr Session_t; service: ptr ptr Service_t;
                        serviceName: cstring): cint {.cdecl,
    importc: "blpapi_Session_getService", dynlib: blpapi_lib.}
# Deprecated: Use blpapi_Session_createIdentity instead

proc Session_createUserHandle*(session: ptr Session_t): ptr UserHandle_t {.cdecl,
    importc: "blpapi_Session_createUserHandle", dynlib: blpapi_lib.}
proc Session_createIdentity*(session: ptr Session_t): ptr Identity_t {.cdecl,
    importc: "blpapi_Session_createIdentity", dynlib: blpapi_lib.}
proc Session_getAbstractSession*(session: ptr Session_t): ptr AbstractSession_t {.
    cdecl, importc: "blpapi_Session_getAbstractSession", dynlib: blpapi_lib.}
proc SubscriptionItr_create*(session: ptr Session_t): ptr SubscriptionIterator_t {.
    cdecl, importc: "blpapi_SubscriptionItr_create", dynlib: blpapi_lib.}
proc SubscriptionItr_destroy*(`iterator`: ptr SubscriptionIterator_t) {.cdecl,
    importc: "blpapi_SubscriptionItr_destroy", dynlib: blpapi_lib.}
proc SubscriptionItr_next*(`iterator`: ptr SubscriptionIterator_t;
                          subscriptionString: cstringArray;
                          correlationId: ptr CorrelationId_t; status: ptr cint): cint {.
    cdecl, importc: "blpapi_SubscriptionItr_next", dynlib: blpapi_lib.}
proc SubscriptionItr_isValid*(`iterator`: ptr SubscriptionIterator_t): cint {.cdecl,
    importc: "blpapi_SubscriptionItr_isValid", dynlib: blpapi_lib.}