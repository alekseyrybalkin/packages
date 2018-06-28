#!/bin/sh

pkgname=xineramaproto
pkgver=1.2.1
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13648

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
