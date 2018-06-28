#!/bin/sh

_pkgname=xkbcomp
pkgname=xorg-${_pkgname}
pkgver=1.4.1
vcs=git
gittag=${_pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
