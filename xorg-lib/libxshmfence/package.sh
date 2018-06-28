#!/bin/sh

pkgname=libxshmfence
pkgver=1.3
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1792

undead_make() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
