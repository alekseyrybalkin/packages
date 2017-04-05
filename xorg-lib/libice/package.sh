#!/bin/sh

pkgname=libice
pkgver=1.0.9
vcs=git
gittag=libICE-${pkgver}
srcdir=${location}/libICE-${pkgver}
relmon_id=1638

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
