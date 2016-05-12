#!/bin/sh

pkgname=libxss
pkgver=1.2.2
vcs=git
gittag=libXScrnSaver-${pkgver}
srcdir=${location}/libXScrnSaver-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
