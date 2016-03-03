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
# blpapi_correlationid.h                                             -*-C++-*-

#@PURPOSE: Provide a key to identify individual subscriptions or requests
#
#@CLASSES:
# blpapi::CorrelationId: a key to track requests and subscriptions
#
#@DESCRIPTION: This component provides an identifier that is attached on to
# individual subscriptions and requests. CorrelationId are used to distinguish
# between various subscriptions and are a way to find the response for an
# asynchronous request.
import types
import defs

type
  ManagedPtr_t_data* = object {.union.}
    intValue*: cint
    `ptr`*: pointer

  ManagedPtr_ManagerFunction_t* = proc (managedPtr: ptr ManagedPtr_t;
                                     srcPtr: ptr ManagedPtr_t; operation: cint): cint {.
      cdecl.}

  ManagedPtr_t* = object
    pointer*: pointer
    userData*: array[4, ManagedPtr_t_data]
    manager*: ManagedPtr_ManagerFunction_t

  CorrelationValue = object
    intValue : UInt64_t
    ptrValue : ManagedPtr_t  

  CorrelationId_t* = object
    size* {.bitsize:8.}: cuint               # fill in the size of this struct
    valueType* {.bitsize:4.}: cuint          # type of value held by this correlation id
    classId* {.bitsize:16.}: cuint            # user defined classification id
    reserved* {.bitsize:4.}: cuint           # for internal use must be 0
    value*: CorrelationValue

