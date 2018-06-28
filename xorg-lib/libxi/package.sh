#!/bin/sh

pkgname=libxi
pkgver=1.7.9
vcs=git
gittag=libXi-${pkgver}
relmon_id=1778

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
