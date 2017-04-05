#!/bin/sh

pkgname=libxtst
pkgver=1.2.3
vcs=git
gittag=libXtst-${pkgver}
srcdir=${location}/libXtst-${pkgver}
relmon_id=1794

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
