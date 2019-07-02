#!/bin/sh

pkgname=libxcursor
pkgver=1.2.0
vcs=git
gittag=libXcursor-${pkgver}
relmon_id=1770

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
