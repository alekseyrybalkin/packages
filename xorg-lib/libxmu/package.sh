#!/bin/sh

pkgname=libxmu
pkgver=1.1.2
vcs=git
gittag=libXmu-${pkgver}
relmon_id=1785

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
