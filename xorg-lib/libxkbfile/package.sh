#!/bin/sh

pkgname=libxkbfile
pkgver=1.0.9
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1781

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
