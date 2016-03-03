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
# blpapi_request.h                                                   -*-C++-*-

#@PURPOSE: Defines a request which can be sent for a service.
#
#@CLASSES:
# blpapi::Request: a request for a particular service
#
#@DESCRIPTION: This file defines a 'Request'. A generic Request object is
# created for a service using Service::createRequest() and sent over a session
# using Session::sendRequest().
include blpapi.dll 

import types 
import correlationid 
import element 
import exception 
import defs 

type
  Request* = object
  
  Request_t* = Request

proc Request_destroy*(request: ptr Request_t) {.cdecl,
    importc: "blpapi_Request_destroy", dynlib: blpapi_lib.}
proc Request_elements*(request: ptr Request_t): ptr Element_t {.cdecl,
    importc: "blpapi_Request_elements", dynlib: blpapi_lib.}
proc Request_setPreferredRoute*(request: ptr Request_t;
                               correlationId: ptr CorrelationId_t) {.cdecl,
    importc: "blpapi_Request_setPreferredRoute", dynlib: blpapi_lib.}