#!/bin/sh

pkgname=libice
pkgver=1.0.9
vcs=git
gittag=libICE-${pkgver}
relmon_id=1638

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
