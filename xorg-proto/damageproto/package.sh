#!/bin/sh

pkgname=damageproto
pkgver=1.2.1
vcs=git
gittag=${pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
