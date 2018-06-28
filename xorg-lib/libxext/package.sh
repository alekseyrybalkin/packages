#!/bin/sh

pkgname=libxext
pkgver=1.3.3
vcs=git
gittag=libXext-${pkgver}
relmon_id=1774

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
