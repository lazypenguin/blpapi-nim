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
# blpapi_subscriptionlist.h                                          -*-C++-*-

#@PURPOSE: Provide a list of subscriptions.
#
#@CLASSES:
# blpapi::SubscriptionList: Represents a list of subscriptions.
#
#@DESCRIPTION: This component provides a structure to hold the data used (and
# returned) by the 'Session::subscribe', 'Session::resubscribe', and
# 'Session::unsubscribe' methods.  This structure comprises a list in which
# each list entry contains two primary fields: a 'CorrelationId' associated
# with the subscription, and a string, called a *subscription* *string*,
# describing the data to be delivered as a part of the subscription.
#
# STRUCTURE OF SUBSCRIPTION STRING
# ---------------------------------
# The simplest form of a subscription string is a *fully* *qualified*
# subscription string, which has the following structure:
#
# "//blp/mktdata/ticker/IBM US Equity?fields=BID,ASK&interval=2"
#  \-----------/\------/\-----------/\------------------------/
#        |          |         |                  |
#     Service    Prefix   Instrument           Suffix
#
# Such a fully-qualified string is composed of:
#: Service Identifier: a string matching the expression
#:   '^//[-_.a-zA-Z0-9]+/[-_.a-zA-Z0-9]+$', e.g. //blp/mktdata.  See
#:   'blpapi_abstractsession' for further details.
#:
#: Prefix: a string matching the expression '/([-_.a-zA-Z0-9]+/)?', often used
#:   as a symbology identifier.  Common examples include '/ticker/' and
#:   '/cusip/'.  Not all services make use of prefices.  Note than an "empty"
#:   topic prefix consists of the string "/", so the topic prefix always
#:   separates the service string from the instrument string.
#:
#: Instrument: a non-empty string that does not contain the character '?'
#:   (i.e. a string matching '[^?]+') e.g. "IBM US Equity", or "SPX Index".
#:   The service, prefix, and instrument together uniquely identify a source
#:   for subscription data.
#:
#: Suffix: a suffix contains a question mark followed by a list of options
#:   which can affect the content delivery.  The format of these options is
#:   service specific, but they generally follow URI query string conventions:
#:   a sequence of "key=value" pairs separated by "&" characters.  Further,
#:   many common services follow the convention that the value given for the
#:   'fields' key is formatted as a comma-separated list of field names.
#:   BLPAPI provides several convenience functions to assist in formatting
#:   subscription strings for services that make use of these conventions;
#:   see the 'SubscriptionList::add' methods for details.
#
# Subscription strings need not be fully qualified: BLPAPI allows the service
# and prefix to be omitted from subscription strings, and automatically
# qualifies these strings using information stored in a 'Session' object.
#
# QUALIFYING SUBSCRIPTION STRINGS
# -------------------------------
# The subscription strings passed to 'Session::subscribe' and
# 'Session::resubscribe' are automatically qualified if the service identifier
# is missing (i.e. if the subscription string does not start with "//"). The
# subscription parameters (i.e. the optional part after instrument identifier)
# are never modified.
# The rules for qualifying the subscription string are:
#
#: o If the subscription string begins with "//" then it is assumed to be a
#:   a fully qualified subscription string including service identifier,
#:   prefix, and instrument.  In this case the string will not be modified and
#:   session options defaults have no affect on the subscription.
#:
#: o If the subscription string begins with a '/' and the second character is
#:   not '/', then the string is assumed to begin with the topic prefix, but
#:   no service identifier. In this case the string is qualified by prepending
#:   the 'SessionOptions::defaultSubscriptionService()' to the specified
#:   string.
#:
#: o If the subscription string does not begin with a '/' it is assumed to
#:   begin with an instrument identifier.  In this case the string is
#:   qualified by prepending the
#:   'SessionOptions::defaultSubscriptionService()' followed by
#:   'SessionOptions::defaultTopicPrefix()' to the specified string.
#:   If the 'defaultTopicPrefix' is empty or null, then the prefix used is
#:   '/'.  Otherwise (in the case of a nontrivial prefix) if the separator '/'
#:   is not specified at the beginning or the end of the 'defaultTopicPrefix',
#:   then it will be added.
include blpapi.dll 

import correlationid 
import defs 
import exception 
import types

type
  SubscriptionList* = object
  
  SubscriptionList_t* = SubscriptionList

proc SubscriptionList_create*(): ptr SubscriptionList_t {.cdecl,
    importc: "blpapi_SubscriptionList_create", dynlib: blpapi_lib.}
proc SubscriptionList_destroy*(list: ptr SubscriptionList_t) {.cdecl,
    importc: "blpapi_SubscriptionList_destroy", dynlib: blpapi_lib.}
proc SubscriptionList_add*(list: ptr SubscriptionList_t;
                          subscriptionString: cstring;
                          correlationId: ptr CorrelationId_t; fields: cstringArray;
                          options: cstringArray; numfields: csize; numOptions: csize): cint {.
    cdecl, importc: "blpapi_SubscriptionList_add", dynlib: blpapi_lib.}
proc SubscriptionList_addResolved*(list: ptr SubscriptionList_t;
                                  subscriptionString: cstring;
                                  correlationId: ptr CorrelationId_t): cint {.cdecl,
    importc: "blpapi_SubscriptionList_addResolved", dynlib: blpapi_lib.}
proc SubscriptionList_clear*(list: ptr SubscriptionList_t): cint {.cdecl,
    importc: "blpapi_SubscriptionList_clear", dynlib: blpapi_lib.}
proc SubscriptionList_append*(dest: ptr SubscriptionList_t;
                             src: ptr SubscriptionList_t): cint {.cdecl,
    importc: "blpapi_SubscriptionList_append", dynlib: blpapi_lib.}
proc SubscriptionList_size*(list: ptr SubscriptionList_t): cint {.cdecl,
    importc: "blpapi_SubscriptionList_size", dynlib: blpapi_lib.}
proc SubscriptionList_correlationIdAt*(list: ptr SubscriptionList_t;
                                      result: ptr CorrelationId_t; index: csize): cint {.
    cdecl, importc: "blpapi_SubscriptionList_correlationIdAt", dynlib: blpapi_lib.}
proc SubscriptionList_topicStringAt*(list: ptr SubscriptionList_t;
                                    result: cstringArray; index: csize): cint {.
    cdecl, importc: "blpapi_SubscriptionList_topicStringAt", dynlib: blpapi_lib.}
proc SubscriptionList_isResolvedAt*(list: ptr SubscriptionList_t; result: ptr cint;
                                   index: csize): cint {.cdecl,
    importc: "blpapi_SubscriptionList_isResolvedAt", dynlib: blpapi_lib.}