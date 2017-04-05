#!/bin/sh

pkgname=libxv
pkgver=1.0.11
vcs=git
gittag=libXv-${pkgver}
srcdir=${location}/libXv-${pkgver}
relmon_id=1795

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
