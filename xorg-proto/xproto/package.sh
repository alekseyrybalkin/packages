#!/bin/sh

pkgname=xproto
pkgver=7.0.31
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13650

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
