#!/bin/sh

pkgname=libxinerama
pkgver=1.1.3
vcs=git
gittag=libXinerama-${pkgver}
relmon_id=1779

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
