#!/bin/sh

pkgname=fontsproto
pkgver=2.1.3
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13472

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
