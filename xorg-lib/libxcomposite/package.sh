#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.4
vcs=git
gittag=libXcomposite-${pkgver}
srcdir=${location}/libXcomposite-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
