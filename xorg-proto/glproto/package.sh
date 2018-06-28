#!/bin/sh

pkgname=glproto
pkgver=1.4.17
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13494

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
