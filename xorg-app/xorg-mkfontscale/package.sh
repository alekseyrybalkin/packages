#!/bin/sh

_pkgname=mkfontscale
pkgname=xorg-${_pkgname}
pkgver=1.1.3
vcs=git
gittag=${_pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
