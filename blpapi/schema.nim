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
# blpapi_schema.h                                                    -*-C++-*-

#@PURPOSE: Provide a representation of a schema describing structured messages
#
#@CLASSES:
# blpapi::SchemaStatus: the version status of a schema
# blpapi::SchemaTypeDefinition: definitions of schema types
# blpapi::SchemaElementDefinition: definitions of message elements
#
#@DESCRIPTION: This component provides types for representing schemata which
# describe structured messages. Such schemata consist of two distinct kinds of
# definitions: "type" definitions (represented by 'SchemaTypeDefinition'
# objects) declare types than can be used within other definitions (of both
# kinds); an "element" definition defines a specific field by associating a
# field identifier with a particular type, as well as the number of values of
# that type that are permitted to be associated with that identifier.
include dll

import constant 
import defs 
import exception 
import name
import streamproxy
import types

type
  SchemaElementDefinition_t* = pointer
  SchemaTypeDefinition_t* = pointer

proc SchemaElementDefinition_name*(field: ptr SchemaElementDefinition_t): ptr Name_t {.
    cdecl, importc: "blpapi_SchemaElementDefinition_name", dynlib: blpapi_lib.}
proc SchemaElementDefinition_description*(field: ptr SchemaElementDefinition_t): cstring {.
    cdecl, importc: "blpapi_SchemaElementDefinition_description",
    dynlib: blpapi_lib.}
proc SchemaElementDefinition_status*(field: ptr SchemaElementDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaElementDefinition_status", dynlib: blpapi_lib.}
proc SchemaElementDefinition_type*(field: ptr SchemaElementDefinition_t): ptr SchemaTypeDefinition_t {.
    cdecl, importc: "blpapi_SchemaElementDefinition_type", dynlib: blpapi_lib.}
proc SchemaElementDefinition_numAlternateNames*(
    field: ptr SchemaElementDefinition_t): csize {.cdecl,
    importc: "blpapi_SchemaElementDefinition_numAlternateNames",
    dynlib: blpapi_lib.}
proc SchemaElementDefinition_getAlternateName*(
    field: ptr SchemaElementDefinition_t; index: csize): ptr Name_t {.cdecl,
    importc: "blpapi_SchemaElementDefinition_getAlternateName", dynlib: blpapi_lib.}
#   -- NOT USED or IMPLEMENTED: removing
# 
# size_t blpapi_SchemaElementDefinition_numNames(
#         const blpapi_SchemaElementDefinition_t *field);

proc SchemaElementDefinition_minValues*(field: ptr SchemaElementDefinition_t): csize {.
    cdecl, importc: "blpapi_SchemaElementDefinition_minValues", dynlib: blpapi_lib.}
proc SchemaElementDefinition_maxValues*(field: ptr SchemaElementDefinition_t): csize {.
    cdecl, importc: "blpapi_SchemaElementDefinition_maxValues", dynlib: blpapi_lib.}
proc SchemaElementDefinition_print*(element: ptr SchemaElementDefinition_t;
                                   streamWriter: StreamWriter_t;
                                   userStream: pointer; level: cint;
                                   spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_SchemaElementDefinition_print", dynlib: blpapi_lib.}
proc SchemaElementDefinition_setUserData*(field: ptr SchemaElementDefinition_t;
    userdata: pointer) {.cdecl,
                       importc: "blpapi_SchemaElementDefinition_setUserData",
                       dynlib: blpapi_lib.}
proc SchemaElementDefinition_userData*(field: ptr SchemaElementDefinition_t): pointer {.
    cdecl, importc: "blpapi_SchemaElementDefinition_userData", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_name*(`type`: ptr SchemaTypeDefinition_t): ptr Name_t {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_name", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_description*(`type`: ptr SchemaTypeDefinition_t): cstring {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_description", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_status*(`type`: ptr SchemaTypeDefinition_t): cint {.cdecl,
    importc: "blpapi_SchemaTypeDefinition_status", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_datatype*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_datatype", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isComplexType*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isComplexType", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isSimpleType*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isSimpleType", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isEnumerationType*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isEnumerationType",
    dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isComplex*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isComplex", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isSimple*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isSimple", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_isEnumeration*(`type`: ptr SchemaTypeDefinition_t): cint {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_isEnumeration", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_numElementDefinitions*(
    `type`: ptr SchemaTypeDefinition_t): csize {.cdecl,
    importc: "blpapi_SchemaTypeDefinition_numElementDefinitions",
    dynlib: blpapi_lib.}
proc SchemaTypeDefinition_getElementDefinition*(
    `type`: ptr SchemaTypeDefinition_t; nameString: cstring; name: ptr Name_t): ptr SchemaElementDefinition_t {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_getElementDefinition",
    dynlib: blpapi_lib.}
proc SchemaTypeDefinition_getElementDefinitionAt*(
    `type`: ptr SchemaTypeDefinition_t; index: csize): ptr SchemaElementDefinition_t {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_getElementDefinitionAt",
    dynlib: blpapi_lib.}
proc SchemaTypeDefinition_print*(element: ptr SchemaTypeDefinition_t;
                                streamWriter: StreamWriter_t; userStream: pointer;
                                level: cint; spacesPerLevel: cint): cint {.cdecl,
    importc: "blpapi_SchemaTypeDefinition_print", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_setUserData*(element: ptr SchemaTypeDefinition_t;
                                      userdata: pointer) {.cdecl,
    importc: "blpapi_SchemaTypeDefinition_setUserData", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_userData*(element: ptr SchemaTypeDefinition_t): pointer {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_userData", dynlib: blpapi_lib.}
proc SchemaTypeDefinition_enumeration*(element: ptr SchemaTypeDefinition_t): ptr ConstantList_t {.
    cdecl, importc: "blpapi_SchemaTypeDefinition_enumeration", dynlib: blpapi_lib.}