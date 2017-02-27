#!/bin/sh

pkgname=libx11
pkgver=1.6.5
vcs=git
gittag=libX11-${pkgver}
srcdir=${location}/libX11-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
