#!/bin/sh

pkgname=ragel
pkgver=7.0.0.12
vcs=git
#FIXME no tag
gittag=48cb9c83bfc00b1c5cb44308b9ed2f31fb629b42
#gittag=ragel-${pkgver}
relmon_id=12105
relmon_sed='s/ragel-//g;s/\.tar\.gz//g'

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
