#!/bin/sh

pkgname=xcb-proto
pkgver=1.13
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13646

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
