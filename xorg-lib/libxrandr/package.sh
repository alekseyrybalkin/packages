#!/bin/sh

pkgname=libxrandr
pkgver=1.5.1
vcs=git
gittag=libXrandr-${pkgver}
srcdir=${location}/libXrandr-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
