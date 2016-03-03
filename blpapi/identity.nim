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
# blpapi_identity.h                                                  -*-C++-*-

#@PURPOSE: Provide access to the entitlements for a user.
#
#@CLASSES:
# blpapi::Identity: Represents an identification of a user
#
#@DESCRIPTION: This component provides an identification of a user and
# implements the access to the entitlements.
include blpapi.dll 

import defs 
import exception 
import service 
import types 

proc Identity_release*(handle: ptr Identity_t) {.cdecl,
    importc: "blpapi_Identity_release", dynlib: blpapi_lib.}
proc Identity_addRef*(handle: ptr Identity_t): cint {.cdecl,
    importc: "blpapi_Identity_addRef", dynlib: blpapi_lib.}
proc Identity_hasEntitlements*(handle: ptr Identity_t; service: ptr Service_t;
                              eidElement: ptr Element_t; entitlementIds: ptr cint;
                              numEntitlements: csize;
                              failedEntitlements: ptr cint;
                              failedEntitlementsCount: ptr cint): cint {.cdecl,
    importc: "blpapi_Identity_hasEntitlements", dynlib: blpapi_lib.}
proc Identity_isAuthorized*(handle: ptr Identity_t; service: ptr Service_t): cint {.
    cdecl, importc: "blpapi_Identity_isAuthorized", dynlib: blpapi_lib.}
proc Identity_getSeatType*(handle: ptr Identity_t; seatType: ptr cint): cint {.cdecl,
    importc: "blpapi_Identity_getSeatType", dynlib: blpapi_lib.}