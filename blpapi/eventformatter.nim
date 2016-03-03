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
# blpapi_eventformatter.h                                            -*-C++-*-

#@PURPOSE: Add messages to an Event for publishing
#
#@CLASSES:
# blpapi::EventFormatter: A Mechanism to add information to an Event.
#
#@DESCRIPTION: This component adds messages to an Event which can be
# later published.
include blpapi.dll 

import correlationid 
import datetime
import defs 
import event 
import topic 
import types 

proc EventFormatter_create*(event: ptr Event_t): ptr EventFormatter_t {.cdecl,
    importc: "blpapi_EventFormatter_create", dynlib: blpapi_lib.}
proc EventFormatter_destroy*(victim: ptr EventFormatter_t) {.cdecl,
    importc: "blpapi_EventFormatter_destroy", dynlib: blpapi_lib.}
proc EventFormatter_appendMessage*(formatter: ptr EventFormatter_t;
                                  typeString: cstring; typeName: ptr Name_t;
                                  topic: ptr Topic_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendMessage", dynlib: blpapi_lib.}
proc EventFormatter_appendMessageSeq*(formatter: ptr EventFormatter_t;
                                     typeString: cstring; typeName: ptr Name_t;
                                     topic: ptr Topic_t; sequenceNumber: cuint;
                                     a7: cuint): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendMessageSeq", dynlib: blpapi_lib.}
proc EventFormatter_appendResponse*(formatter: ptr EventFormatter_t;
                                   typeString: cstring; typeName: ptr Name_t): cint {.
    cdecl, importc: "blpapi_EventFormatter_appendResponse", dynlib: blpapi_lib.}
proc EventFormatter_appendRecapMessage*(formatter: ptr EventFormatter_t;
                                       topic: ptr Topic_t; cid: ptr CorrelationId_t): cint {.
    cdecl, importc: "blpapi_EventFormatter_appendRecapMessage", dynlib: blpapi_lib.}
proc EventFormatter_appendRecapMessageSeq*(formatter: ptr EventFormatter_t;
    topic: ptr Topic_t; cid: ptr CorrelationId_t; sequenceNumber: cuint; a6: cuint): cint {.
    cdecl, importc: "blpapi_EventFormatter_appendRecapMessageSeq",
    dynlib: blpapi_lib.}
proc EventFormatter_setValueBool*(formatter: ptr EventFormatter_t;
                                 typeString: cstring; typeName: ptr Name_t;
                                 value: Bool_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueBool", dynlib: blpapi_lib.}
proc EventFormatter_setValueChar*(formatter: ptr EventFormatter_t;
                                 typeString: cstring; typeName: ptr Name_t;
                                 value: char): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueChar", dynlib: blpapi_lib.}
proc EventFormatter_setValueInt32*(formatter: ptr EventFormatter_t;
                                  typeString: cstring; typeName: ptr Name_t;
                                  value: Int32_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueInt32", dynlib: blpapi_lib.}
proc EventFormatter_setValueInt64*(formatter: ptr EventFormatter_t;
                                  typeString: cstring; typeName: ptr Name_t;
                                  value: Int64_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueInt64", dynlib: blpapi_lib.}
proc EventFormatter_setValueFloat32*(formatter: ptr EventFormatter_t;
                                    typeString: cstring; typeName: ptr Name_t;
                                    value: Float32_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueFloat32", dynlib: blpapi_lib.}
proc EventFormatter_setValueFloat64*(formatter: ptr EventFormatter_t;
                                    typeString: cstring; typeName: ptr Name_t;
                                    value: Float64_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueFloat64", dynlib: blpapi_lib.}
proc EventFormatter_setValueDatetime*(formatter: ptr EventFormatter_t;
                                     typeString: cstring; typeName: ptr Name_t;
                                     value: ptr Datetime_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueDatetime", dynlib: blpapi_lib.}
proc EventFormatter_setValueString*(formatter: ptr EventFormatter_t;
                                   typeString: cstring; typeName: ptr Name_t;
                                   value: cstring): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueString", dynlib: blpapi_lib.}
proc EventFormatter_setValueFromName*(formatter: ptr EventFormatter_t;
                                     typeString: cstring; typeName: ptr Name_t;
                                     value: ptr Name_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_setValueFromName", dynlib: blpapi_lib.}
proc EventFormatter_setValueNull*(formatter: ptr EventFormatter_t;
                                 typeString: cstring; typeName: ptr Name_t): cint {.
    cdecl, importc: "blpapi_EventFormatter_setValueNull", dynlib: blpapi_lib.}
proc EventFormatter_pushElement*(formatter: ptr EventFormatter_t;
                                typeString: cstring; typeName: ptr Name_t): cint {.
    cdecl, importc: "blpapi_EventFormatter_pushElement", dynlib: blpapi_lib.}
proc EventFormatter_popElement*(formatter: ptr EventFormatter_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_popElement", dynlib: blpapi_lib.}
proc EventFormatter_appendValueBool*(formatter: ptr EventFormatter_t; value: Bool_t): cint {.
    cdecl, importc: "blpapi_EventFormatter_appendValueBool", dynlib: blpapi_lib.}
proc EventFormatter_appendValueChar*(formatter: ptr EventFormatter_t; value: char): cint {.
    cdecl, importc: "blpapi_EventFormatter_appendValueChar", dynlib: blpapi_lib.}
proc EventFormatter_appendValueInt32*(formatter: ptr EventFormatter_t;
                                     value: Int32_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueInt32", dynlib: blpapi_lib.}
proc EventFormatter_appendValueInt64*(formatter: ptr EventFormatter_t;
                                     value: Int64_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueInt64", dynlib: blpapi_lib.}
proc EventFormatter_appendValueFloat32*(formatter: ptr EventFormatter_t;
                                       value: Float32_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueFloat32", dynlib: blpapi_lib.}
proc EventFormatter_appendValueFloat64*(formatter: ptr EventFormatter_t;
                                       value: Float64_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueFloat64", dynlib: blpapi_lib.}
proc EventFormatter_appendValueDatetime*(formatter: ptr EventFormatter_t;
                                        value: ptr Datetime_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueDatetime", dynlib: blpapi_lib.}
proc EventFormatter_appendValueString*(formatter: ptr EventFormatter_t;
                                      value: cstring): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueString", dynlib: blpapi_lib.}
proc EventFormatter_appendValueFromName*(formatter: ptr EventFormatter_t;
                                        value: ptr Name_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendValueFromName", dynlib: blpapi_lib.}
proc EventFormatter_appendElement*(formatter: ptr EventFormatter_t): cint {.cdecl,
    importc: "blpapi_EventFormatter_appendElement", dynlib: blpapi_lib.}