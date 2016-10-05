#!/bin/sh

pkgname=libxrender
pkgver=0.9.10
vcs=git
gittag=libXrender-${pkgver}
srcdir=${location}/libXrender-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
