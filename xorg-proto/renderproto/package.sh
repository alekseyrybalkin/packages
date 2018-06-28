#!/bin/sh

pkgname=renderproto
pkgver=0.11.1
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13611

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
