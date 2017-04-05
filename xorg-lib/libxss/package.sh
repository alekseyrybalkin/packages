#!/bin/sh

pkgname=libxss
pkgver=1.2.2
vcs=git
gittag=libXScrnSaver-${pkgver}
srcdir=${location}/libXScrnSaver-${pkgver}
relmon_id=1791

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
