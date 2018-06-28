#!/bin/sh

pkgname=libxtst
pkgver=1.2.3
vcs=git
gittag=libXtst-${pkgver}
relmon_id=1794

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
