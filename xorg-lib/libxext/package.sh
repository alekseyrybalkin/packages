#!/bin/sh

pkgname=libxext
pkgver=1.3.3
vcs=git
gittag=libXext-${pkgver}
srcdir=${location}/libXext-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
