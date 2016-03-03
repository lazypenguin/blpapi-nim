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
# blpapi_service.h                                                   -*-C++-*-

#@PURPOSE: A service which provides access to API data (provide or consume).
#
#@CLASSES:
#   blpapi::Service: The service which provides access to API data.
# blpapi::Operation: An operation which can be performed by the Service.
#
#@DESCRIPTION: This file defines a 'Service'.
# All API data is associated with a 'Service'. A service object is obtained
# from a Session and contains zero or more 'Operations'. A service can be a
# provider service (can generate API data) or a consumer service.
include blpapi.dll 

import defs 
import types 
import schema
import request 
import correlationid 
import streamproxy 

proc Operation_name*(service: ptr Operation_t): cstring {.cdecl,
    importc: "blpapi_Operation_name", dynlib: blpapi_lib.}
proc Operation_description*(service: ptr Operation_t): cstring {.cdecl,
    importc: "blpapi_Operation_description", dynlib: blpapi_lib.}
proc Operation_requestDefinition*(service: ptr Operation_t; requestDefinition: ptr ptr SchemaElementDefinition_t): cint {.
    cdecl, importc: "blpapi_Operation_requestDefinition", dynlib: blpapi_lib.}
proc Operation_numResponseDefinitions*(service: ptr Operation_t): cint {.cdecl,
    importc: "blpapi_Operation_numResponseDefinitions", dynlib: blpapi_lib.}
proc Operation_responseDefinition*(service: ptr Operation_t; responseDefinition: ptr ptr SchemaElementDefinition_t;
                                  index: csize): cint {.cdecl,
    importc: "blpapi_Operation_responseDefinition", dynlib: blpapi_lib.}
proc Service_name*(service: ptr Service_t): cstring {.cdecl,
    importc: "blpapi_Service_name", dynlib: blpapi_lib.}
proc Service_description*(service: ptr Service_t): cstring {.cdecl,
    importc: "blpapi_Service_description", dynlib: blpapi_lib.}
proc Service_numOperations*(service: ptr Service_t): cint {.cdecl,
    importc: "blpapi_Service_numOperations", dynlib: blpapi_lib.}
proc Service_numEventDefinitions*(service: ptr Service_t): cint {.cdecl,
    importc: "blpapi_Service_numEventDefinitions", dynlib: blpapi_lib.}
proc Service_addRef*(service: ptr Service_t): cint {.cdecl,
    importc: "blpapi_Service_addRef", dynlib: blpapi_lib.}
proc Service_release*(service: ptr Service_t) {.cdecl,
    importc: "blpapi_Service_release", dynlib: blpapi_lib.}
proc Service_authorizationServiceName*(service: ptr Service_t): cstring {.cdecl,
    importc: "blpapi_Service_authorizationServiceName", dynlib: blpapi_lib.}
proc Service_getOperation*(service: ptr Service_t; operation: ptr ptr Operation_t;
                          nameString: cstring; name: ptr Name_t): cint {.cdecl,
    importc: "blpapi_Service_getOperation", dynlib: blpapi_lib.}
proc Service_getOperationAt*(service: ptr Service_t; operation: ptr ptr Operation_t;
                            index: csize): cint {.cdecl,
    importc: "blpapi_Service_getOperationAt", dynlib: blpapi_lib.}
proc Service_getEventDefinition*(service: ptr Service_t;
                                result: ptr ptr SchemaElementDefinition_t;
                                nameString: cstring; name: ptr Name_t): cint {.cdecl,
    importc: "blpapi_Service_getEventDefinition", dynlib: blpapi_lib.}
proc Service_getEventDefinitionAt*(service: ptr Service_t;
                                  result: ptr ptr SchemaElementDefinition_t;
                                  index: csize): cint {.cdecl,
    importc: "blpapi_Service_getEventDefinitionAt", dynlib: blpapi_lib.}
proc Service_createRequest*(service: ptr Service_t; request: ptr ptr Request_t;
                           operation: cstring): cint {.cdecl,
    importc: "blpapi_Service_createRequest", dynlib: blpapi_lib.}
proc Service_createAuthorizationRequest*(service: ptr Service_t;
                                        request: ptr ptr Request_t;
                                        operation: cstring): cint {.cdecl,
    importc: "blpapi_Service_createAuthorizationRequest", dynlib: blpapi_lib.}
proc Service_createPublishEvent*(service: ptr Service_t; event: ptr ptr Event_t): cint {.
    cdecl, importc: "blpapi_Service_createPublishEvent", dynlib: blpapi_lib.}
proc Service_createAdminEvent*(service: ptr Service_t; event: ptr ptr Event_t): cint {.
    cdecl, importc: "blpapi_Service_createAdminEvent", dynlib: blpapi_lib.}
proc Service_createResponseEvent*(service: ptr Service_t;
                                 correlationId: ptr CorrelationId_t;
                                 event: ptr ptr Event_t): cint {.cdecl,
    importc: "blpapi_Service_createResponseEvent", dynlib: blpapi_lib.}
proc Service_print*(service: ptr Service_t; streamWriter: StreamWriter_t;
                   stream: pointer; level: cint; spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_Service_print", dynlib: blpapi_lib.}