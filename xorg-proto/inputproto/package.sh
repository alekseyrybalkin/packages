#!/bin/sh

pkgname=inputproto
pkgver=2.3.2
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13508

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
