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
# blpapi_versioninfo.h                                               -*-C++-*-

#@PURPOSE: Provide BLPAPI SDK library version information.
#
#@CLASSES:
# blpapi::VersionInfo: basic BLPAPI SDK library version attribute class
#
#@DESCRIPTION: This component provides access the BLPAPI SDK library version
# information.  Each version of the BLPAPI library is identified by four
# integers: major, minor, patch, and build.
#
# The current major version is 3; there is no guarantee of compatibility
# between different major versions.
#
# Differences in minor version numbers indicate significant feature additions.
# Standard distributions of the BLPAPI have minor version numbers below 128,
# and higher minor numbers are expected to provide APIs that are a superset of
# the APIs provided by lower minor version numbers; i.e. all functionality and
# interfaces supported by BLPAPI 3.7 is also provided by BLPAPI 3.8, while the
# inverse is not typically true. (Bloomberg occasionally distributes library
# versions with version numbers above 127; consult the release information
# distributed with these libraries to determine interoperability with other
# minor versions.)
#
# Increments to patch numbers indicate performance or stability enhancements
# to the library.
#
# Build numbers typically do not carry any information about the library
# version's functionality, but can be used along with the other parts of the
# build number to uniquely identity a precise library binary version (e.g. for
# the purpose of code signing and auditing).
#
#/Usage
#/-----
#/C++ usage
#/- - - - -
# This example logs the BLPAPI version in order to make the logs analysis more
# productive:
#..
#  blpapi::VersionInfo blpapiVersion;
#  // Client log the library version for reference and future debugging
#  log("BLPAPI version: %d.%d.%d.%d",
#      blpapiVersion.majorVersion(),
#      blpapiVersion.minorVersion(),
#      blpapiVersion.patchVersion(),
#      blpapiVersion.buildVersion());
#..
#
#/C usage
#/- - - -
# This example logs the BLPAPI version in order to make the logs analysis more
# productive:
#..
#  int majorVersion, minorVersion, patchVersion, buildVersion;
#  blpapi_getVersionInfo(&majorVersion, &minorVersion, &patchVersion,
#      &buildVersion);
#  // Client log the library version for reference and future debugging
#  log("BLPAPI version: %d.%d.%d.%d", majorVersion, minorVersion,
#      patchVersion, buildVersion);
#..
#
#
# This example provide shows how to use the backward API signature
# compatibility macros BLPAPI_SDK_VERSION and BLPAPI_MAKE_VERSION (see
# blpapi_dispatchtbl.h):
#..
#  #if BLPAPI_SDK_VERSION >= BLPAPI_MAKE_VERSION(3, 3, 7)
#      // Do version 3.3.7 specific stuff here (e.g. adding functions with old
#      // signature to an array so a client code that was compiled with
#      // version 3.3.7 will still be able to run using the new version.
#      ...
#  #elif BLPAPI_SDK_VERSION ...
#..
include blpapi.dll

proc getVersionInfo*(majorVersion: ptr cint; minorVersion: ptr cint;
                    patchVersion: ptr cint; buildVersion: ptr cint) {.cdecl,
    importc: "blpapi_getVersionInfo", dynlib: blpapi_lib.}
# Initialize the 4 parameters with the current release version information
# which include the following version parts: Major, Minor, Patch, and
# Build.

proc getVersionIdentifier*(): cstring {.cdecl,
                                     importc: "blpapi_getVersionIdentifier",
                                     dynlib: blpapi_lib.}
# Return a null-terminated sequence of printable ascii characters (with
# values from 0x20 to 0x7e, inclusive) identifying the version of the
# blpapi runtime library.  The lifetime of the returned string is
# guaranteed until the end of `main()` (but is *not* necessarily usable
# during the C++ static destruction phase).
