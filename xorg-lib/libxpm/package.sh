#!/bin/sh

pkgname=libxpm
pkgver=3.5.12
vcs=git
gittag=libXpm-${pkgver}
relmon_id=1787

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
