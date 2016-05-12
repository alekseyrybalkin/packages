#!/bin/sh

pkgname=libxfixes
pkgver=5.0.1
vcs=git
gittag=libXfixes-${pkgver}
srcdir=${location}/libXfixes-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
