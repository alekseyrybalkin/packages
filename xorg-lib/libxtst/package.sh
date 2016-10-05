#!/bin/sh

pkgname=libxtst
pkgver=1.2.3
vcs=git
gittag=libXtst-${pkgver}
srcdir=${location}/libXtst-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
