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
# blpapi_abstractsession.h                                           -*-C++-*-

#@PURPOSE: A common interface shared between publish and consumer sessions.
#
#@CLASSES:
# blpapi::AbstractSession: shared interface between different session types.
#
#@SEE_ALSO: blpapi_session, blpapi_providersession
#
#@DESCRIPTION: This file defines an abstract class 'AbstractSession' - an
# interfaces which are shared between its concrete implementations 'Session'
# and 'ProviderSession'.
#
# SERVICE IDENTIFIER
# ------------------
# A service identifier is the fully qualified service name which uniquely
# identifies the service in the API infrastructure.
# A service must be of the form "//<namespace>/<local-name>" where
# '<namespace>' and '<local-name>' are non-empty strings of characters from
# the set '[-_.a-zA-Z0-9]'. Service identifiers are case-insensitive, but
# clients are encouraged to prefer identifiers without upper-case characters.
# Note that the <namespace> and <local-name> cannot contain the character
# '/'.

# All of the blpapi_UserHandle_* functions have been deprecated. Please use
# blpapi_Identity_* versions of these functions instead.
include blpapi.dll

import correlationid 
import defs 
import event 
import eventdispatcher 
import identity 
import request 
import service 
import types 

proc UserHandle_release*(handle: ptr UserHandle_t) {.cdecl,
    importc: "blpapi_UserHandle_release", dynlib: blpapi_lib.}
proc UserHandle_addRef*(handle: ptr UserHandle_t): cint {.cdecl,
    importc: "blpapi_UserHandle_addRef", dynlib: blpapi_lib.}
proc UserHandle_hasEntitlements*(handle: ptr UserHandle_t; service: ptr Service_t;
                                eidElement: ptr Element_t;
                                entitlementIds: ptr cint; numEntitlements: csize;
                                failedEntitlements: ptr cint;
                                failedEntitlementsCount: ptr cint): cint {.cdecl,
    importc: "blpapi_UserHandle_hasEntitlements", dynlib: blpapi_lib.}
proc AbstractSession_cancel*(session: ptr AbstractSession_t;
                            correlationIds: ptr CorrelationId_t;
                            numCorrelationIds: csize; requestLabel: cstring;
                            requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_AbstractSession_cancel", dynlib: blpapi_lib.}
proc AbstractSession_sendAuthorizationRequest*(session: ptr AbstractSession_t;
    request: ptr Request_t; identity: ptr Identity_t;
    correlationId: ptr CorrelationId_t; eventQueue: ptr EventQueue_t;
    requestLabel: cstring; requestLabelLen: cint): cint {.cdecl,
    importc: "blpapi_AbstractSession_sendAuthorizationRequest", dynlib: blpapi_lib.}
proc AbstractSession_openService*(session: ptr AbstractSession_t;
                                 serviceIdentifier: cstring): cint {.cdecl,
    importc: "blpapi_AbstractSession_openService", dynlib: blpapi_lib.}
proc AbstractSession_openServiceAsync*(session: ptr AbstractSession_t;
                                      serviceIdentifier: cstring;
                                      correlationId: ptr CorrelationId_t): cint {.
    cdecl, importc: "blpapi_AbstractSession_openServiceAsync", dynlib: blpapi_lib.}
proc AbstractSession_generateToken*(session: ptr AbstractSession_t;
                                   correlationId: ptr CorrelationId_t;
                                   eventQueue: ptr EventQueue_t): cint {.cdecl,
    importc: "blpapi_AbstractSession_generateToken", dynlib: blpapi_lib.}
proc AbstractSession_getService*(session: ptr AbstractSession_t;
                                service: ptr ptr Service_t;
                                serviceIdentifier: cstring): cint {.cdecl,
    importc: "blpapi_AbstractSession_getService", dynlib: blpapi_lib.}
proc AbstractSession_createIdentity*(session: ptr AbstractSession_t): ptr Identity_t {.
    cdecl, importc: "blpapi_AbstractSession_createIdentity", dynlib: blpapi_lib.}