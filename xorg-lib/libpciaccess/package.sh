#!/bin/sh

pkgname=libpciaccess
pkgver=0.13.5
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1703

kiin_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
