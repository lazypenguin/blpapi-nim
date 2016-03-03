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
# blpapi_error.h                                                     -*-C++-*-

#@PURPOSE: Provide a collection of errors that library can return
#
#@DESCRIPTION: This component provides a collection of preprocessor macros
# that define the errors that library can generate.
include blpapi.dll 

template BLPAPI_RESULTCODE*(res: expr): expr =
  ((res) and 0x0000FFFF)

template BLPAPI_RESULTCLASS*(res: expr): expr =
  ((res) and 0x00FF0000)

const
  BLPAPI_UNKNOWN_CLASS* = 0x00000000
  BLPAPI_INVALIDSTATE_CLASS* = 0x00010000
  BLPAPI_INVALIDARG_CLASS* = 0x00020000
  BLPAPI_IOERROR_CLASS* = 0x00030000
  BLPAPI_CNVERROR_CLASS* = 0x00040000
  BLPAPI_BOUNDSERROR_CLASS* = 0x00050000
  BLPAPI_NOTFOUND_CLASS* = 0x00060000
  BLPAPI_FLDNOTFOUND_CLASS* = 0x00070000
  BLPAPI_UNSUPPORTED_CLASS* = 0x00080000
  BLPAPI_ERROR_UNKNOWN* = (BLPAPI_UNKNOWN_CLASS or 1)
  BLPAPI_ERROR_ILLEGAL_ARG* = (BLPAPI_INVALIDARG_CLASS or 2)
  BLPAPI_ERROR_ILLEGAL_ACCESS* = (BLPAPI_UNKNOWN_CLASS or 3)
  BLPAPI_ERROR_INVALID_SESSION* = (BLPAPI_INVALIDARG_CLASS or 4)
  BLPAPI_ERROR_DUPLICATE_CORRELATIONID* = (BLPAPI_INVALIDARG_CLASS or 5)
  BLPAPI_ERROR_INTERNAL_ERROR* = (BLPAPI_UNKNOWN_CLASS or 6)
  BLPAPI_ERROR_RESOLVE_FAILED* = (BLPAPI_IOERROR_CLASS or 7)
  BLPAPI_ERROR_CONNECT_FAILED* = (BLPAPI_IOERROR_CLASS or 8)
  BLPAPI_ERROR_ILLEGAL_STATE* = (BLPAPI_INVALIDSTATE_CLASS or 9)
  BLPAPI_ERROR_CODEC_FAILURE* = (BLPAPI_UNKNOWN_CLASS or 10)
  BLPAPI_ERROR_INDEX_OUT_OF_RANGE* = (BLPAPI_BOUNDSERROR_CLASS or 11)
  BLPAPI_ERROR_INVALID_CONVERSION* = (BLPAPI_CNVERROR_CLASS or 12)
  BLPAPI_ERROR_ITEM_NOT_FOUND* = (BLPAPI_NOTFOUND_CLASS or 13)
  BLPAPI_ERROR_IO_ERROR* = (BLPAPI_IOERROR_CLASS or 14)
  BLPAPI_ERROR_CORRELATION_NOT_FOUND* = (BLPAPI_NOTFOUND_CLASS or 15)
  BLPAPI_ERROR_SERVICE_NOT_FOUND* = (BLPAPI_NOTFOUND_CLASS or 16)
  BLPAPI_ERROR_LOGON_LOOKUP_FAILED* = (BLPAPI_UNKNOWN_CLASS or 17)
  BLPAPI_ERROR_DS_LOOKUP_FAILED* = (BLPAPI_UNKNOWN_CLASS or 18)
  BLPAPI_ERROR_UNSUPPORTED_OPERATION* = (BLPAPI_UNSUPPORTED_CLASS or 19)
  BLPAPI_ERROR_DS_PROPERTY_NOT_FOUND* = (BLPAPI_NOTFOUND_CLASS or 20)

proc getLastErrorDescription*(resultCode: cint): cstring {.cdecl,
    importc: "blpapi_getLastErrorDescription", dynlib: blpapi_lib.}