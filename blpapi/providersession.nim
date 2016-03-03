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
# blpapi_providersession.h                                           -*-C++-*-

#@PURPOSE: Provide a session that can be used for providing services
#
#@CLASSES:
# blpapi::ProviderSession: Session with providing(publishing) services.
# blpapi::ProviderEventHandler: Event handler for ProviderSession
# blpapi::ServiceRegistrationOptions: Container holding registration options.
#
#@DESCRIPTION: ProviderSession inherits from AbstractSession. In addition to
# AbstractSession functionality, ProviderSession provides functions that are
# needed to support publishing like 'registerService', 'createTopics' and
# 'publish'.
#
# Topic Life Cycle
# ----------------
# A provider wishing to publish subscription data must explicitly open each
# topic on which they publish using 'ProviderSession::createTopics' (or 
# 'ProviderSession::createTopicsAsync'). Creating a topic prepares the
# distribution and caching infrastructure for new data associated with the
# topic's resolved identifier. (Note that several different topics could
# resolve to the same ID.) Independent of a topic's creation status is its
# subscription status, i.e. whether there are subscribers ready to receive
# the data published. A topic that is both created and subscribed is
# *activated*.
#
# There are two models for managing topic creation: broadcast and
# interactive. Broadcast publishers proactively call
# 'ProviderSession::createTopic*' for each topic on which they intend to
# publish, while interactive publishers wait to receive a
# 'TopicSubscribed' message (within an 'Event' of type 'Event::TOPIC_STATUS')
# before calling 'ProviderSession::createTopic*' in response. Topics are
# resolved before they are created---it is possible that multiple different
# topic strings will map to the same underlying topic. See below for the
# behavior of the SDK when the same topic is created multiple times.
#
# After 'ProviderSession::createTopic*' is called, the publisher will receive
# a 'TopicCreated' message (within an 'Event::TOPIC_STATUS' event), and when
# there is at least one subscriber to the topic the publisher will then
# receive a 'TopicActivated' message (also within an 'Event::TOPIC_STATUS'
# event). As subscribers come and go, additional 'TopicSubscribed',
# 'TopicActivated', 'TopicUnsubscribed', and 'TopicDeactivated' messages may
# be received by the publisher. A 'Topic' object can be retrieved from each of
# these messages using the 'ProviderSession::getTopic' method, and this
# object can be used for subsequent calls to 'EventFormatter::appendMessage'
# and 'ProviderSession::deleteTopic'. In the case that the same resolved
# topic is created multiple times by a publisher using different names, it is
# unspecified which of those names will be returned by 'Message::topicName'
# for these (or other) messages.
#
# If a publisher no longer intends to publish data on a topic, it can call
# 'ProviderSession::deleteTopic*' to free the internal caching and
# distribution resources associated with the topic. When a resolved topic has
# been deleted the same number of times that it has been created,
# a 'TopicDeleted' message will be delivered, preceded by 'TopicUnsubscribed'
# and 'TopicDeactivated' messages if the topic was still subscribed (and
# activated). No further messages can be published on a deleted topic.
#
# Deregistering a service deletes all topics associated with that service.
#
# Note that 'TopicActivated' and 'TopicDeactivated' messages are entirely
# redundant with 'TopicCreated', 'TopicSubscribed', 'TopicDeleted', and
# 'TopicUnsubscribed' messages, and are provided only for the convenience
# of publishers that do not maintain per-topic state.
include blpapi.dll

import abstractsession 
import correlationid 
import defs 
import event 
import eventdispatcher 
import identity 
import message
import request 
import resolutionlist 
import service 
import sessionoptions 
import subscriptionlist 
import topic 
import topiclist
import types  

type
  ServiceRegistrationOptions* = object
  
  ServiceRegistrationOptions_t* = ServiceRegistrationOptions
  ProviderEventHandler_t* = proc (event: ptr Event_t; session: ptr ProviderSession_t;
                               userData: pointer) {.cdecl.}

proc ProviderSession_create*(parameters: ptr SessionOptions_t;
                            handler: ProviderEventHandler_t;
                            dispatcher: ptr EventDispatcher_t; userData: pointer): ptr ProviderSession_t {.
    cdecl, importc: "blpapi_ProviderSession_create", dynlib: blpapi_lib.}
proc ProviderSession_destroy*(session: ptr ProviderSession_t) {.cdecl,
    importc: "blpapi_ProviderSession_destroy", dynlib: blpapi_lib.}
proc ProviderSession_start*(session: ptr ProviderSession_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_start", dynlib: blpapi_lib.}
proc ProviderSession_startAsync*(session: ptr ProviderSession_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_startAsync", dynlib: blpapi_lib.}
proc ProviderSession_stop*(session: ptr ProviderSession_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_stop", dynlib: blpapi_lib.}
proc ProviderSession_stopAsync*(session: ptr ProviderSession_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_stopAsync", dynlib: blpapi_lib.}
proc ProviderSession_nextEvent*(session: ptr ProviderSession_t;
                               eventPointer: ptr ptr Event_t;
                               timeoutInMilliseconds: cuint): cint {.cdecl,
    importc: "blpapi_ProviderSession_nextEvent", dynlib: blpapi_lib.}
proc ProviderSession_tryNextEvent*(session: ptr ProviderSession_t;
                                  eventPointer: ptr ptr Event_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_tryNextEvent", dynlib: blpapi_lib.}
proc ProviderSession_registerService*(session: ptr ProviderSession_t;
                                     serviceName: cstring;
                                     identity: ptr Identity_t; registrationOptions: ptr ServiceRegistrationOptions_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_registerService", dynlib: blpapi_lib.}
proc ProviderSession_activateSubServiceCodeRange*(session: ptr ProviderSession_t;
    serviceName: cstring; begin: cint; `end`: cint; priority: cint): cint {.cdecl,
    importc: "blpapi_ProviderSession_activateSubServiceCodeRange",
    dynlib: blpapi_lib.}
proc ProviderSession_deactivateSubServiceCodeRange*(
    session: ptr ProviderSession_t; serviceName: cstring; begin: cint; `end`: cint): cint {.
    cdecl, importc: "blpapi_ProviderSession_deactivateSubServiceCodeRange",
    dynlib: blpapi_lib.}
proc ProviderSession_registerServiceAsync*(session: ptr ProviderSession_t;
    serviceName: cstring; identity: ptr Identity_t;
    correlationId: ptr CorrelationId_t;
    registrationOptions: ptr ServiceRegistrationOptions_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_registerServiceAsync", dynlib: blpapi_lib.}
proc ProviderSession_deregisterService*(session: ptr ProviderSession_t;
                                       serviceName: cstring): cint {.cdecl,
    importc: "blpapi_ProviderSession_deregisterService", dynlib: blpapi_lib.}
proc ProviderSession_resolve*(session: ptr ProviderSession_t;
                             resolutionList: ptr ResolutionList_t;
                             resolveMode: cint; identity: ptr Identity_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_resolve", dynlib: blpapi_lib.}
proc ProviderSession_resolveAsync*(session: ptr ProviderSession_t;
                                  resolutionList: ptr ResolutionList_t;
                                  resolveMode: cint; identity: ptr Identity_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_resolveAsync", dynlib: blpapi_lib.}
proc ProviderSession_createTopics*(session: ptr ProviderSession_t;
                                  topicList: ptr TopicList_t; resolveMode: cint;
                                  identity: ptr Identity_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_createTopics", dynlib: blpapi_lib.}
proc ProviderSession_createTopicsAsync*(session: ptr ProviderSession_t;
                                       topicList: ptr TopicList_t;
                                       resolveMode: cint; identity: ptr Identity_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_createTopicsAsync", dynlib: blpapi_lib.}
proc ProviderSession_getTopic*(session: ptr ProviderSession_t;
                              message: ptr Message_t; topic: ptr ptr Topic_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_getTopic", dynlib: blpapi_lib.}
proc ProviderSession_createTopic*(session: ptr ProviderSession_t;
                                 message: ptr Message_t; topic: ptr ptr Topic_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_createTopic", dynlib: blpapi_lib.}
proc ProviderSession_createServiceStatusTopic*(session: ptr ProviderSession_t;
    service: ptr Service_t; topic: ptr ptr Topic_t): cint {.cdecl,
    importc: "blpapi_ProviderSession_createServiceStatusTopic", dynlib: blpapi_lib.}
proc ProviderSession_deleteTopics*(session: ptr ProviderSession_t;
                                  topics: ptr ptr Topic_t; numTopics: csize): cint {.
    cdecl, importc: "blpapi_ProviderSession_deleteTopics", dynlib: blpapi_lib.}
proc ProviderSession_publish*(session: ptr ProviderSession_t; event: ptr Event_t): cint {.
    cdecl, importc: "blpapi_ProviderSession_publish", dynlib: blpapi_lib.}
proc ProviderSession_sendResponse*(session: ptr ProviderSession_t;
                                  event: ptr Event_t; isPartialResponse: cint): cint {.
    cdecl, importc: "blpapi_ProviderSession_sendResponse", dynlib: blpapi_lib.}
proc ProviderSession_getAbstractSession*(session: ptr ProviderSession_t): ptr AbstractSession_t {.
    cdecl, importc: "blpapi_ProviderSession_getAbstractSession", dynlib: blpapi_lib.}
# ServiceRegistrationOptions

proc ServiceRegistrationOptions_create*(): ptr ServiceRegistrationOptions_t {.cdecl,
    importc: "blpapi_ServiceRegistrationOptions_create", dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_duplicate*(
    parameters: ptr ServiceRegistrationOptions_t): ptr ServiceRegistrationOptions_t {.
    cdecl, importc: "blpapi_ServiceRegistrationOptions_duplicate",
    dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_destroy*(parameters: ptr ServiceRegistrationOptions_t) {.
    cdecl, importc: "blpapi_ServiceRegistrationOptions_destroy", dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_copy*(lhs: ptr ServiceRegistrationOptions_t;
                                     rhs: ptr ServiceRegistrationOptions_t) {.
    cdecl, importc: "blpapi_ServiceRegistrationOptions_copy", dynlib: blpapi_lib.}
# SUBSERVICE CODES

proc ServiceRegistrationOptions_addActiveSubServiceCodeRange*(
    parameters: ptr ServiceRegistrationOptions_t; start: cint; `end`: cint;
    priority: cint): cint {.cdecl, importc: "blpapi_ServiceRegistrationOptions_addActiveSubServiceCodeRange",
                         dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_removeAllActiveSubServiceCodeRanges*(
    parameters: ptr ServiceRegistrationOptions_t) {.cdecl, importc: "blpapi_ServiceRegistrationOptions_removeAllActiveSubServiceCodeRanges",
    dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_setGroupId*(
    parameters: ptr ServiceRegistrationOptions_t; groupId: cstring;
    groupIdLength: cuint) {.cdecl, importc: "blpapi_ServiceRegistrationOptions_setGroupId",
                          dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_setServicePriority*(
    parameters: ptr ServiceRegistrationOptions_t; priority: cint): cint {.cdecl,
    importc: "blpapi_ServiceRegistrationOptions_setServicePriority",
    dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_setPartsToRegister*(
    parameters: ptr ServiceRegistrationOptions_t; parts: cint) {.cdecl,
    importc: "blpapi_ServiceRegistrationOptions_setPartsToRegister",
    dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_getGroupId*(
    parameters: ptr ServiceRegistrationOptions_t; groupdIdBuffer: cstring;
    groupIdLength: ptr cint): cint {.cdecl, importc: "blpapi_ServiceRegistrationOptions_getGroupId",
                                 dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_getServicePriority*(
    parameters: ptr ServiceRegistrationOptions_t): cint {.cdecl,
    importc: "blpapi_ServiceRegistrationOptions_getServicePriority",
    dynlib: blpapi_lib.}
proc ServiceRegistrationOptions_getPartsToRegister*(
    parameters: ptr ServiceRegistrationOptions_t): cint {.cdecl,
    importc: "blpapi_ServiceRegistrationOptions_getPartsToRegister",
    dynlib: blpapi_lib.}