#!/bin/sh

pkgname=libxss
pkgver=1.2.2
vcs=git
gittag=libXScrnSaver-${pkgver}
relmon_id=1791

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
