#!/bin/sh

pkgname=libpciaccess
pkgver=0.14
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1703

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
