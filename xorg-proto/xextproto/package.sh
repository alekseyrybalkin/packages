#!/bin/sh

pkgname=xextproto
pkgver=7.3.0
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13647

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
