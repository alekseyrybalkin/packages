#!/bin/sh

pkgname=libxfixes
pkgver=5.0.3
vcs=git
gittag=libXfixes-${pkgver}
relmon_id=1775

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
