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
# blpapi_exception.h                                                 -*-C++-*-

#@PURPOSE: Defines Exceptions that can be thrown by the blpapi library.
#
#@CLASSES:
#                        blpapi_ErrorInfo: C struct to get more info on error
#                       blpapi::Exception: Base class from all exceptions
# blpapi::DuplicateCorrelationIdException: Duplicate CorrelationId exception
#           blpapi::InvalidStateException: Invalid state exception
#        blpapi::InvalidArgumentException: Invalid argument exception
#      blpapi::InvalidConversionException: Invalid conversion exception
#        blpapi::IndexOutOfRangeException: Index out of range exception
#          blpapi::FieldNotFoundException: Field not found exception
#               blpapi::NotFoundException: Not present exception
#           blpapi::UnknownErrorException: Unknown error exception
#   blpapi::UnsupportedOperationException: Unsupported operation exception
#                   blpapi::ExceptionUtil: Internal exception generating class
#
#@DESCRIPTION: This file defines various exceptions that blpapi can throw.
#
include blpapi.dll

import defs 
import error 

type
  ErrorInfo* = object
    exceptionClass*: cint
    description*: array[256, char]

  ErrorInfo_t* = ErrorInfo

proc getErrorInfo*(buffer: ptr ErrorInfo_t; errorCode: cint): cint {.cdecl,
    importc: "blpapi_getErrorInfo", dynlib: blpapi_lib.}