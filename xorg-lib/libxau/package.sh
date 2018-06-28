#!/bin/sh

pkgname=libxau
pkgver=1.0.8
vcs=git
gittag=libXau-${pkgver}
relmon_id=1765

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
