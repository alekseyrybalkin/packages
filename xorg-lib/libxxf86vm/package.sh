#!/bin/sh

pkgname=libxxf86vm
pkgver=1.1.4
vcs=git
gittag=libXxf86vm-${pkgver}
srcdir=${location}/libXxf86vm-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
