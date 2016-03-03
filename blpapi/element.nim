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
# blpapi_element.h                                                   -*-C++-*-

#@PURPOSE: Provide a representation of an item in a message.
#
#@CLASSES:
# blpapi::Element: Represents an item in a message
#
#@DESCRIPTION: This component implements a representation of an item in a
# 'Message'.
include blpapi.dll 

import types
import schema 
import datetime 
import name 
import defs 
import streamproxy 

proc Element_name*(element: ptr Element_t): ptr Name_t {.cdecl,
    importc: "blpapi_Element_name", dynlib: blpapi_lib.}
proc Element_nameString*(element: ptr Element_t): cstring {.cdecl,
    importc: "blpapi_Element_nameString", dynlib: blpapi_lib.}
proc Element_definition*(element: ptr Element_t): ptr SchemaElementDefinition_t {.
    cdecl, importc: "blpapi_Element_definition", dynlib: blpapi_lib.}
proc Element_datatype*(element: ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_datatype", dynlib: blpapi_lib.}
proc Element_isComplexType*(element: ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_isComplexType", dynlib: blpapi_lib.}
proc Element_isArray*(element: ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_isArray", dynlib: blpapi_lib.}
proc Element_isReadOnly*(element: ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_isReadOnly", dynlib: blpapi_lib.}
proc Element_numValues*(element: ptr Element_t): csize {.cdecl,
    importc: "blpapi_Element_numValues", dynlib: blpapi_lib.}
proc Element_numElements*(element: ptr Element_t): csize {.cdecl,
    importc: "blpapi_Element_numElements", dynlib: blpapi_lib.}
proc Element_isNullValue*(element: ptr Element_t; position: csize): cint {.cdecl,
    importc: "blpapi_Element_isNullValue", dynlib: blpapi_lib.}
proc Element_isNull*(element: ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_isNull", dynlib: blpapi_lib.}
proc Element_print*(element: ptr Element_t; streamWriter: StreamWriter_t;
                   stream: pointer; level: cint; spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_Element_print", dynlib: blpapi_lib.}
proc Element_getElementAt*(element: ptr Element_t; result: ptr ptr Element_t;
                          position: csize): cint {.cdecl,
    importc: "blpapi_Element_getElementAt", dynlib: blpapi_lib.}
proc Element_getElement*(element: ptr Element_t; result: ptr ptr Element_t;
                        nameString: cstring; name: ptr Name_t): cint {.cdecl,
    importc: "blpapi_Element_getElement", dynlib: blpapi_lib.}
proc Element_hasElement*(element: ptr Element_t; nameString: cstring; name: ptr Name_t): cint {.
    cdecl, importc: "blpapi_Element_hasElement", dynlib: blpapi_lib.}
proc Element_hasElementEx*(element: ptr Element_t; nameString: cstring;
                          name: ptr Name_t; excludeNullElements: cint; reserved: cint): cint {.
    cdecl, importc: "blpapi_Element_hasElementEx", dynlib: blpapi_lib.}
proc Element_getValueAsBool*(element: ptr Element_t; buffer: ptr Bool_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_getValueAsBool", dynlib: blpapi_lib.}
proc Element_getValueAsChar*(element: ptr Element_t; buffer: ptr Char_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_getValueAsChar", dynlib: blpapi_lib.}
proc Element_getValueAsInt32*(element: ptr Element_t; buffer: ptr Int32_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_getValueAsInt32", dynlib: blpapi_lib.}
proc Element_getValueAsInt64*(element: ptr Element_t; buffer: ptr Int64_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_getValueAsInt64", dynlib: blpapi_lib.}
proc Element_getValueAsFloat32*(element: ptr Element_t; buffer: ptr Float32_t;
                               index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsFloat32", dynlib: blpapi_lib.}
proc Element_getValueAsFloat64*(element: ptr Element_t; buffer: ptr Float64_t;
                               index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsFloat64", dynlib: blpapi_lib.}
proc Element_getValueAsString*(element: ptr Element_t; buffer: cstringArray;
                              index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsString", dynlib: blpapi_lib.}
proc Element_getValueAsDatetime*(element: ptr Element_t; buffer: ptr Datetime_t;
                                index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsDatetime", dynlib: blpapi_lib.}
proc Element_getValueAsHighPrecisionDatetime*(element: ptr Element_t;
    buffer: ptr HighPrecisionDatetime_t; index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsHighPrecisionDatetime", dynlib: blpapi_lib.}
proc Element_getValueAsElement*(element: ptr Element_t; buffer: ptr ptr Element_t;
                               index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsElement", dynlib: blpapi_lib.}
proc Element_getValueAsName*(element: ptr Element_t; buffer: ptr ptr Name_t;
                            index: csize): cint {.cdecl,
    importc: "blpapi_Element_getValueAsName", dynlib: blpapi_lib.}
proc Element_getChoice*(element: ptr Element_t; result: ptr ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_getChoice", dynlib: blpapi_lib.}
proc Element_setValueBool*(element: ptr Element_t; value: Bool_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueBool", dynlib: blpapi_lib.}
proc Element_setValueChar*(element: ptr Element_t; value: Char_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueChar", dynlib: blpapi_lib.}
proc Element_setValueInt32*(element: ptr Element_t; value: Int32_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueInt32", dynlib: blpapi_lib.}
proc Element_setValueInt64*(element: ptr Element_t; value: Int64_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueInt64", dynlib: blpapi_lib.}
proc Element_setValueFloat32*(element: ptr Element_t; value: Float32_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueFloat32", dynlib: blpapi_lib.}
proc Element_setValueFloat64*(element: ptr Element_t; value: Float64_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueFloat64", dynlib: blpapi_lib.}
proc Element_setValueString*(element: ptr Element_t; value: cstring; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueString", dynlib: blpapi_lib.}
proc Element_setValueDatetime*(element: ptr Element_t; value: ptr Datetime_t;
                              index: csize): cint {.cdecl,
    importc: "blpapi_Element_setValueDatetime", dynlib: blpapi_lib.}
proc Element_setValueHighPrecisionDatetime*(element: ptr Element_t;
    value: ptr HighPrecisionDatetime_t; index: csize): cint {.cdecl,
    importc: "blpapi_Element_setValueHighPrecisionDatetime", dynlib: blpapi_lib.}
proc Element_setValueFromElement*(element: ptr Element_t; value: ptr Element_t;
                                 index: csize): cint {.cdecl,
    importc: "blpapi_Element_setValueFromElement", dynlib: blpapi_lib.}
proc Element_setValueFromName*(element: ptr Element_t; value: ptr Name_t; index: csize): cint {.
    cdecl, importc: "blpapi_Element_setValueFromName", dynlib: blpapi_lib.}
proc Element_setElementBool*(element: ptr Element_t; nameString: cstring;
                            name: ptr Name_t; value: Bool_t): cint {.cdecl,
    importc: "blpapi_Element_setElementBool", dynlib: blpapi_lib.}
proc Element_setElementChar*(element: ptr Element_t; nameString: cstring;
                            name: ptr Name_t; value: Char_t): cint {.cdecl,
    importc: "blpapi_Element_setElementChar", dynlib: blpapi_lib.}
proc Element_setElementInt32*(element: ptr Element_t; nameString: cstring;
                             name: ptr Name_t; value: Int32_t): cint {.cdecl,
    importc: "blpapi_Element_setElementInt32", dynlib: blpapi_lib.}
proc Element_setElementInt64*(element: ptr Element_t; nameString: cstring;
                             name: ptr Name_t; value: Int64_t): cint {.cdecl,
    importc: "blpapi_Element_setElementInt64", dynlib: blpapi_lib.}
proc Element_setElementFloat32*(element: ptr Element_t; nameString: cstring;
                               name: ptr Name_t; value: Float32_t): cint {.cdecl,
    importc: "blpapi_Element_setElementFloat32", dynlib: blpapi_lib.}
proc Element_setElementFloat64*(element: ptr Element_t; nameString: cstring;
                               name: ptr Name_t; value: Float64_t): cint {.cdecl,
    importc: "blpapi_Element_setElementFloat64", dynlib: blpapi_lib.}
proc Element_setElementString*(element: ptr Element_t; nameString: cstring;
                              name: ptr Name_t; value: cstring): cint {.cdecl,
    importc: "blpapi_Element_setElementString", dynlib: blpapi_lib.}
proc Element_setElementDatetime*(element: ptr Element_t; nameString: cstring;
                                name: ptr Name_t; value: ptr Datetime_t): cint {.cdecl,
    importc: "blpapi_Element_setElementDatetime", dynlib: blpapi_lib.}
proc Element_setElementHighPrecisionDatetime*(element: ptr Element_t;
    nameString: cstring; name: ptr Name_t; value: ptr HighPrecisionDatetime_t): cint {.
    cdecl, importc: "blpapi_Element_setElementHighPrecisionDatetime",
    dynlib: blpapi_lib.}
proc Element_setElementFromField*(element: ptr Element_t; nameString: cstring;
                                 name: ptr Name_t; sourcebuffer: ptr Element_t): cint {.
    cdecl, importc: "blpapi_Element_setElementFromField", dynlib: blpapi_lib.}
proc Element_setElementFromName*(element: ptr Element_t; elementName: cstring;
                                name: ptr Name_t; buffer: ptr Name_t): cint {.cdecl,
    importc: "blpapi_Element_setElementFromName", dynlib: blpapi_lib.}
proc Element_appendElement*(element: ptr Element_t;
                           appendedElement: ptr ptr Element_t): cint {.cdecl,
    importc: "blpapi_Element_appendElement", dynlib: blpapi_lib.}
proc Element_setChoice*(element: ptr Element_t; resultElement: ptr ptr Element_t;
                       nameCstr: cstring; name: ptr Name_t; index: csize): cint {.cdecl,
    importc: "blpapi_Element_setChoice", dynlib: blpapi_lib.}