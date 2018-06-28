#!/bin/sh

pkgname=libxv
pkgver=1.0.11
vcs=git
gittag=libXv-${pkgver}
relmon_id=1795

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
