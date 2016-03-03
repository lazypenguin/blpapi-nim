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
# blpapi_sessionoptions.h                                            -*-C++-*-

#@PURPOSE: A common interface shared between publish and consumer sessions.
#
#@CLASSES:
#  blpapi::SessionOptions: user specified options when creating a session.
#
#@SEE_ALSO: blpapi_abstractsession, blpapi_session, blpapi_providersession
#
#@DESCRIPTION: This file defines a 'SessionOptions' class which is used
# to specify various options during session creation.
#
#
#/Usage
#/-----
# The following snippet shows to use the SessionOptions when creating a
# 'Session'.
#..
# #include <blpapi_session.h>
# SessionOptions sessionOptions;
# sessionOptions.setServerHost("127.0.0.1");
# Session session(sessionOptions);
# if (!session.start()) {
#      std::cout << "Failed to start session." << std::endl;
#      return;
# }
#..
include blpapi.dll

import defs 
import exception 
import types 

proc SessionOptions_create*(): ptr SessionOptions_t {.cdecl,
    importc: "blpapi_SessionOptions_create", dynlib: blpapi_lib.}
proc SessionOptions_duplicate*(parameters: ptr SessionOptions_t): ptr SessionOptions_t {.
    cdecl, importc: "blpapi_SessionOptions_duplicate", dynlib: blpapi_lib.}
proc SessionOptions_copy*(lhs: ptr SessionOptions_t; rhs: ptr SessionOptions_t) {.
    cdecl, importc: "blpapi_SessionOptions_copy", dynlib: blpapi_lib.}
proc SessionOptions_destroy*(parameters: ptr SessionOptions_t) {.cdecl,
    importc: "blpapi_SessionOptions_destroy", dynlib: blpapi_lib.}
proc SessionOptions_setServerHost*(parameters: ptr SessionOptions_t;
                                  serverHost: cstring): cint {.cdecl,
    importc: "blpapi_SessionOptions_setServerHost", dynlib: blpapi_lib.}
proc SessionOptions_setServerPort*(parameters: ptr SessionOptions_t;
                                  serverPort: cushort): cint {.cdecl,
    importc: "blpapi_SessionOptions_setServerPort", dynlib: blpapi_lib.}
proc SessionOptions_setServerAddress*(parameters: ptr SessionOptions_t;
                                     serverHost: cstring; serverPort: cushort;
                                     index: csize): cint {.cdecl,
    importc: "blpapi_SessionOptions_setServerAddress", dynlib: blpapi_lib.}
proc SessionOptions_removeServerAddress*(parameters: ptr SessionOptions_t;
                                        index: csize): cint {.cdecl,
    importc: "blpapi_SessionOptions_removeServerAddress", dynlib: blpapi_lib.}
proc SessionOptions_setConnectTimeout*(parameters: ptr SessionOptions_t;
                                      timeoutInMilliseconds: cuint): cint {.cdecl,
    importc: "blpapi_SessionOptions_setConnectTimeout", dynlib: blpapi_lib.}
proc SessionOptions_setDefaultServices*(parameters: ptr SessionOptions_t;
                                       defaultServices: cstring): cint {.cdecl,
    importc: "blpapi_SessionOptions_setDefaultServices", dynlib: blpapi_lib.}
proc SessionOptions_setDefaultSubscriptionService*(
    parameters: ptr SessionOptions_t; serviceIdentifier: cstring): cint {.cdecl,
    importc: "blpapi_SessionOptions_setDefaultSubscriptionService",
    dynlib: blpapi_lib.}
proc SessionOptions_setDefaultTopicPrefix*(parameters: ptr SessionOptions_t;
    prefix: cstring) {.cdecl,
                     importc: "blpapi_SessionOptions_setDefaultTopicPrefix",
                     dynlib: blpapi_lib.}
proc SessionOptions_setAllowMultipleCorrelatorsPerMsg*(
    parameters: ptr SessionOptions_t; allowMultipleCorrelatorsPerMsg: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setAllowMultipleCorrelatorsPerMsg",
    dynlib: blpapi_lib.}
proc SessionOptions_setClientMode*(parameters: ptr SessionOptions_t;
                                  clientMode: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setClientMode", dynlib: blpapi_lib.}
proc SessionOptions_setMaxPendingRequests*(parameters: ptr SessionOptions_t;
    maxPendingRequests: cint) {.cdecl, importc: "blpapi_SessionOptions_setMaxPendingRequests",
                              dynlib: blpapi_lib.}
proc SessionOptions_setAutoRestartOnDisconnection*(
    parameters: ptr SessionOptions_t; autoRestart: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setAutoRestartOnDisconnection",
    dynlib: blpapi_lib.}
proc SessionOptions_setAutoRestart*(parameters: ptr SessionOptions_t;
                                   autoRestart: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setAutoRestart", dynlib: blpapi_lib.}
proc SessionOptions_setAuthenticationOptions*(parameters: ptr SessionOptions_t;
    authOptions: cstring) {.cdecl, importc: "blpapi_SessionOptions_setAuthenticationOptions",
                          dynlib: blpapi_lib.}
proc SessionOptions_setNumStartAttempts*(parameters: ptr SessionOptions_t;
                                        numStartAttempts: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setNumStartAttempts", dynlib: blpapi_lib.}
proc SessionOptions_setMaxEventQueueSize*(parameters: ptr SessionOptions_t;
    maxEventQueueSize: csize) {.cdecl, importc: "blpapi_SessionOptions_setMaxEventQueueSize",
                              dynlib: blpapi_lib.}
proc SessionOptions_setSlowConsumerWarningHiWaterMark*(
    parameters: ptr SessionOptions_t; hiWaterMark: cfloat): cint {.cdecl,
    importc: "blpapi_SessionOptions_setSlowConsumerWarningHiWaterMark",
    dynlib: blpapi_lib.}
proc SessionOptions_setSlowConsumerWarningLoWaterMark*(
    parameters: ptr SessionOptions_t; loWaterMark: cfloat): cint {.cdecl,
    importc: "blpapi_SessionOptions_setSlowConsumerWarningLoWaterMark",
    dynlib: blpapi_lib.}
proc SessionOptions_setDefaultKeepAliveInactivityTime*(
    parameters: ptr SessionOptions_t; inactivityMsecs: cint): cint {.cdecl,
    importc: "blpapi_SessionOptions_setDefaultKeepAliveInactivityTime",
    dynlib: blpapi_lib.}
proc SessionOptions_setDefaultKeepAliveResponseTimeout*(
    parameters: ptr SessionOptions_t; timeoutMsecs: cint): cint {.cdecl,
    importc: "blpapi_SessionOptions_setDefaultKeepAliveResponseTimeout",
    dynlib: blpapi_lib.}
proc SessionOptions_setKeepAliveEnabled*(parameters: ptr SessionOptions_t;
                                        isEnabled: cint): cint {.cdecl,
    importc: "blpapi_SessionOptions_setKeepAliveEnabled", dynlib: blpapi_lib.}
proc SessionOptions_setRecordSubscriptionDataReceiveTimes*(
    parameters: ptr SessionOptions_t; shouldRecord: cint) {.cdecl,
    importc: "blpapi_SessionOptions_setRecordSubscriptionDataReceiveTimes",
    dynlib: blpapi_lib.}
proc SessionOptions_serverHost*(parameters: ptr SessionOptions_t): cstring {.cdecl,
    importc: "blpapi_SessionOptions_serverHost", dynlib: blpapi_lib.}
proc SessionOptions_serverPort*(parameters: ptr SessionOptions_t): cuint {.cdecl,
    importc: "blpapi_SessionOptions_serverPort", dynlib: blpapi_lib.}
proc SessionOptions_numServerAddresses*(parameters: ptr SessionOptions_t): cint {.
    cdecl, importc: "blpapi_SessionOptions_numServerAddresses", dynlib: blpapi_lib.}
proc SessionOptions_getServerAddress*(parameters: ptr SessionOptions_t;
                                     serverHost: cstringArray;
                                     serverPort: ptr cushort; index: csize): cint {.
    cdecl, importc: "blpapi_SessionOptions_getServerAddress", dynlib: blpapi_lib.}
proc SessionOptions_connectTimeout*(parameters: ptr SessionOptions_t): cuint {.cdecl,
    importc: "blpapi_SessionOptions_connectTimeout", dynlib: blpapi_lib.}
proc SessionOptions_defaultServices*(parameters: ptr SessionOptions_t): cstring {.
    cdecl, importc: "blpapi_SessionOptions_defaultServices", dynlib: blpapi_lib.}
proc SessionOptions_defaultSubscriptionService*(parameters: ptr SessionOptions_t): cstring {.
    cdecl, importc: "blpapi_SessionOptions_defaultSubscriptionService",
    dynlib: blpapi_lib.}
proc SessionOptions_defaultTopicPrefix*(parameters: ptr SessionOptions_t): cstring {.
    cdecl, importc: "blpapi_SessionOptions_defaultTopicPrefix", dynlib: blpapi_lib.}
proc SessionOptions_allowMultipleCorrelatorsPerMsg*(
    parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_allowMultipleCorrelatorsPerMsg",
    dynlib: blpapi_lib.}
proc SessionOptions_clientMode*(parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_clientMode", dynlib: blpapi_lib.}
proc SessionOptions_maxPendingRequests*(parameters: ptr SessionOptions_t): cint {.
    cdecl, importc: "blpapi_SessionOptions_maxPendingRequests", dynlib: blpapi_lib.}
proc SessionOptions_autoRestartOnDisconnection*(parameters: ptr SessionOptions_t): cint {.
    cdecl, importc: "blpapi_SessionOptions_autoRestartOnDisconnection",
    dynlib: blpapi_lib.}
proc SessionOptions_autoRestart*(parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_autoRestart", dynlib: blpapi_lib.}
proc SessionOptions_authenticationOptions*(parameters: ptr SessionOptions_t): cstring {.
    cdecl, importc: "blpapi_SessionOptions_authenticationOptions",
    dynlib: blpapi_lib.}
proc SessionOptions_numStartAttempts*(parameters: ptr SessionOptions_t): cint {.
    cdecl, importc: "blpapi_SessionOptions_numStartAttempts", dynlib: blpapi_lib.}
proc SessionOptions_maxEventQueueSize*(parameters: ptr SessionOptions_t): csize {.
    cdecl, importc: "blpapi_SessionOptions_maxEventQueueSize", dynlib: blpapi_lib.}
proc SessionOptions_slowConsumerWarningHiWaterMark*(
    parameters: ptr SessionOptions_t): cfloat {.cdecl,
    importc: "blpapi_SessionOptions_slowConsumerWarningHiWaterMark",
    dynlib: blpapi_lib.}
proc SessionOptions_slowConsumerWarningLoWaterMark*(
    parameters: ptr SessionOptions_t): cfloat {.cdecl,
    importc: "blpapi_SessionOptions_slowConsumerWarningLoWaterMark",
    dynlib: blpapi_lib.}
proc SessionOptions_defaultKeepAliveInactivityTime*(
    parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_defaultKeepAliveInactivityTime",
    dynlib: blpapi_lib.}
proc SessionOptions_defaultKeepAliveResponseTimeout*(
    parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_defaultKeepAliveResponseTimeout",
    dynlib: blpapi_lib.}
proc SessionOptions_keepAliveEnabled*(parameters: ptr SessionOptions_t): cint {.
    cdecl, importc: "blpapi_SessionOptions_keepAliveEnabled", dynlib: blpapi_lib.}
proc SessionOptions_recordSubscriptionDataReceiveTimes*(
    parameters: ptr SessionOptions_t): cint {.cdecl,
    importc: "blpapi_SessionOptions_recordSubscriptionDataReceiveTimes",
    dynlib: blpapi_lib.}