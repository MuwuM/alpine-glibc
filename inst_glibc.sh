#!/bin/sh

export ALPINE_GLIBC_BASE_URL="https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64"
export ALPINE_GLIBC_PACKAGE="glibc-2.21-r2.apk"
export ALPINE_GLIBC_BIN_PACKAGE="glibc-bin-2.21-r2.apk"
cd /tmp/
wget "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_BIN_PACKAGE"
apk add --allow-untrusted "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE"
/usr/glibc/usr/bin/ldconfig "/lib" "/usr/glibc/usr/lib"
echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf
