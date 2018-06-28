#!/bin/sh

pkgname=libxcomposite
pkgver=0.4.4
vcs=git
gittag=libXcomposite-${pkgver}
relmon_id=1769

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
