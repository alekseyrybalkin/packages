#!/bin/sh

pkgname=libxi
pkgver=1.7.9
vcs=git
gittag=libXi-${pkgver}
srcdir=${location}/libXi-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
