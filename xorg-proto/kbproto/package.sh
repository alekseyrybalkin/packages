#!/bin/sh

pkgname=kbproto
pkgver=1.0.7
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13512

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
