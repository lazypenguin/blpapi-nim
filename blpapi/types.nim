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
# blpapi_types.h                                                     -*-C++-*-

#@PURPOSE: Provide BLPAPI types.
#
#@CLASSES:
# blpapi::DataType: Data types in the schema
#
#@DESCRIPTION: This component implements BLPAPI types.

type
  Bool_t* = cint
  Char_t* = char
  UChar_t* = cuchar
  Int16_t* = cshort
  UInt16_t* = cushort
  Int32_t* = cint
  UInt32_t* = cuint
  Int64_t* = clonglong
  UInt64_t* = culonglong
  Float32_t* = cfloat
  Float64_t* = cdouble
  DataType_t* = enum
    BLPAPI_DATATYPE_BOOL = 1, 
    BLPAPI_DATATYPE_CHAR = 2, 
    BLPAPI_DATATYPE_BYTE = 3,
    BLPAPI_DATATYPE_INT32 = 4, 
    BLPAPI_DATATYPE_INT64 = 5, 
    BLPAPI_DATATYPE_FLOAT32 = 6,
    BLPAPI_DATATYPE_FLOAT64 = 7, 
    BLPAPI_DATATYPE_STRING = 8,
    BLPAPI_DATATYPE_BYTEARRAY = 9, 
    BLPAPI_DATATYPE_DATE = 10,
    BLPAPI_DATATYPE_TIME = 11, 
    BLPAPI_DATATYPE_DECIMAL = 12,
    BLPAPI_DATATYPE_DATETIME = 13, 
    BLPAPI_DATATYPE_ENUMERATION = 14,
    BLPAPI_DATATYPE_SEQUENCE = 15, 
    BLPAPI_DATATYPE_CHOICE = 16,
    BLPAPI_DATATYPE_CORRELATION_ID = 17


type
  Logging_Severity_t* = enum
    Logging_SEVERITY_OFF = 0, 
    Logging_SEVERITY_FATAL = 1,
    Logging_SEVERITY_ERROR = 2,
    Logging_SEVERITY_WARN = 3, 
    Logging_SEVERITY_INFO = 4, 
    Logging_SEVERITY_DEBUG = 5,
    Logging_SEVERITY_TRACE = 6

type
  AbstractSession* = object
  AbstractSession_t* = AbstractSession

  Constant* = object
  Constant_t* = Constant

  ConstantList* = object
  ConstantList_t* = ConstantList

  Element* = object
  Element_t* = Element

  Event* = object
  Event_t* = Event

  EventDispatcher* = object
  EventDispatcher_t* = EventDispatcher

  EventFormatter* = object
  EventFormatter_t* = EventFormatter

  EventQueue* = object
  EventQueue_t* = EventQueue

  MessageIterator* = object
  MessageIterator_t* = MessageIterator

  Name* = object
  Name_t* = Name

  Operation* = object
  Operation_t* = Operation

  ProviderSession* = object
  ProviderSession_t* = ProviderSession

  Service* = object
  Service_t* = Service

  Session* = object
  Session_t* = Session

  SessionOptions* = object
  SessionOptions_t* = SessionOptions

  SubscriptionItrerator* = object
  SubscriptionIterator_t* = SubscriptionItrerator

  Identity* = object
  UserHandle* = Identity
  UserHandle_t* = Identity
  
  Identity_t* = Identity
