#!/bin/sh

pkgname=libxdamage
pkgver=1.1.4
vcs=git
gittag=libXdamage-${pkgver}
relmon_id=1771

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
