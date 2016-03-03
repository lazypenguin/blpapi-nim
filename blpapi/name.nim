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
# blpapi_name.h                                                      -*-C++-*-

#@PURPOSE: Provide a representation of strings for use as container keys.
#
#@CLASSES:
# blpapi::Name: constant string in an efficient form for use as container keys
#
#@DESCRIPTION: This component implements a representation of a string which is
# efficient for use as a key in a container (constant-time hashing and
# ordering operations using the standard "intern string" technique).
include blpapi.dll

import types
import defs

proc Name_create*(nameString: cstring): ptr Name_t {.cdecl,
    importc: "blpapi_Name_create", dynlib: blpapi_lib.}
proc Name_destroy*(name: ptr Name_t) {.cdecl, importc: "blpapi_Name_destroy",
                                   dynlib: blpapi_lib.}
proc Name_duplicate*(src: ptr Name_t): ptr Name_t {.cdecl,
    importc: "blpapi_Name_duplicate", dynlib: blpapi_lib.}
proc Name_equalsStr*(name: ptr Name_t; string: cstring): cint {.cdecl,
    importc: "blpapi_Name_equalsStr", dynlib: blpapi_lib.}
proc Name_string*(name: ptr Name_t): cstring {.cdecl, importc: "blpapi_Name_string",
    dynlib: blpapi_lib.}
proc Name_length*(name: ptr Name_t): csize {.cdecl, importc: "blpapi_Name_length",
                                        dynlib: blpapi_lib.}
proc Name_findName*(nameString: cstring): ptr Name_t {.cdecl,
    importc: "blpapi_Name_findName", dynlib: blpapi_lib.}