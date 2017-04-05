#!/bin/sh

pkgname=libxdamage
pkgver=1.1.4
vcs=git
gittag=libXdamage-${pkgver}
srcdir=${location}/libXdamage-${pkgver}
relmon_id=1771

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
