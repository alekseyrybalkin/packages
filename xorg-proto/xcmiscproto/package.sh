#!/bin/sh

pkgname=xcmiscproto
pkgver=1.2.2
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=11792

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
