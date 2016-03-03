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
# blpapi_constant.h                                                  -*-C++-*-

#@PURPOSE: Provide a representation for schema-level enumeration constants.
#
#@CLASSES:
#     blpapi::Constant: schema enumeration constant
# blpapi::ConstantList: list of schema enumeration constants
#
#@SEE_ALSO: blpapi_schema
#
#@DESCRIPTION: This component provides a representation of a schema
# enumeration constant, and a representation for lists of such constants.
include blpapi.dll

import types
import name
import defs
import datetime 
import exception

proc Constant_setUserData*(constant: ptr Constant_t; userdata: pointer) {.cdecl,
    importc: "blpapi_Constant_setUserData", dynlib: blpapi_lib.}
proc Constant_name*(constant: ptr Constant_t): ptr Name_t {.cdecl,
    importc: "blpapi_Constant_name", dynlib: blpapi_lib.}
proc Constant_description*(constant: ptr Constant_t): cstring {.cdecl,
    importc: "blpapi_Constant_description", dynlib: blpapi_lib.}
proc Constant_status*(constant: ptr Constant_t): cint {.cdecl,
    importc: "blpapi_Constant_status", dynlib: blpapi_lib.}
proc Constant_datatype*(constant: ptr Constant_t): cint {.cdecl,
    importc: "blpapi_Constant_datatype", dynlib: blpapi_lib.}
proc Constant_getValueAsChar*(constant: ptr Constant_t; buffer: ptr Char_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsChar", dynlib: blpapi_lib.}
proc Constant_getValueAsInt32*(constant: ptr Constant_t; buffer: ptr Int32_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsInt32", dynlib: blpapi_lib.}
proc Constant_getValueAsInt64*(constant: ptr Constant_t; buffer: ptr Int64_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsInt64", dynlib: blpapi_lib.}
proc Constant_getValueAsFloat32*(constant: ptr Constant_t; buffer: ptr Float32_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsFloat32", dynlib: blpapi_lib.}
proc Constant_getValueAsFloat64*(constant: ptr Constant_t; buffer: ptr Float64_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsFloat64", dynlib: blpapi_lib.}
proc Constant_getValueAsDatetime*(constant: ptr Constant_t; buffer: ptr Datetime_t): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsDatetime", dynlib: blpapi_lib.}
proc Constant_getValueAsString*(constant: ptr Constant_t; buffer: cstringArray): cint {.
    cdecl, importc: "blpapi_Constant_getValueAsString", dynlib: blpapi_lib.}
proc Constant_userData*(constant: ptr Constant_t): pointer {.cdecl,
    importc: "blpapi_Constant_userData", dynlib: blpapi_lib.}
proc ConstantList_setUserData*(constant: ptr ConstantList_t; userdata: pointer) {.
    cdecl, importc: "blpapi_ConstantList_setUserData", dynlib: blpapi_lib.}
proc ConstantList_name*(list: ptr ConstantList_t): ptr Name_t {.cdecl,
    importc: "blpapi_ConstantList_name", dynlib: blpapi_lib.}
proc ConstantList_description*(list: ptr ConstantList_t): cstring {.cdecl,
    importc: "blpapi_ConstantList_description", dynlib: blpapi_lib.}
proc ConstantList_numConstants*(list: ptr ConstantList_t): cint {.cdecl,
    importc: "blpapi_ConstantList_numConstants", dynlib: blpapi_lib.}
proc ConstantList_datatype*(constant: ptr ConstantList_t): cint {.cdecl,
    importc: "blpapi_ConstantList_datatype", dynlib: blpapi_lib.}
proc ConstantList_status*(list: ptr ConstantList_t): cint {.cdecl,
    importc: "blpapi_ConstantList_status", dynlib: blpapi_lib.}
proc ConstantList_getConstant*(constant: ptr ConstantList_t; nameString: cstring;
                              name: ptr Name_t): ptr Constant_t {.cdecl,
    importc: "blpapi_ConstantList_getConstant", dynlib: blpapi_lib.}
proc ConstantList_getConstantAt*(constant: ptr ConstantList_t; index: csize): ptr Constant_t {.
    cdecl, importc: "blpapi_ConstantList_getConstantAt", dynlib: blpapi_lib.}
proc ConstantList_userData*(constant: ptr ConstantList_t): pointer {.cdecl,
    importc: "blpapi_ConstantList_userData", dynlib: blpapi_lib.}