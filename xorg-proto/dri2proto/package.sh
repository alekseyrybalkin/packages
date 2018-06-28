#!/bin/sh

pkgname=dri2proto
pkgver=2.8
vcs=git
gittag=${pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
