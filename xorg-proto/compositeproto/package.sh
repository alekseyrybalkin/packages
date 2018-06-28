#!/bin/sh

pkgname=compositeproto
pkgver=0.4.2
vcs=git
gittag=${pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
