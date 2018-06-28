#!/bin/sh

pkgname=libsm
pkgver=1.2.2
vcs=git
gittag=libSM-${pkgver}
relmon_id=1726

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
