# Copyright 2013. Bloomberg Finance L.P.
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
# blpapi_diagnosticsutil.h                                           -*-C++-*-

#@PURPOSE: Provide api to access diagnostics information on the blpapi library
#
#@CLASSES:
# blpapi::DiagnosticsUtil: collection of diagnostics information functions
#
#@DESCRIPTION: This component provide a collection of functions which give
# access to various sets of diagnostics information on the 'blpapi' library.
include blpapi.dll 

import defs 

proc DiagnosticsUtil_memoryInfo*(buffer: cstring; bufferLength: csize): cint {.cdecl,
    importc: "blpapi_DiagnosticsUtil_memoryInfo", dynlib: blpapi_lib.}