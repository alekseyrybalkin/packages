#!/bin/sh

_pkgname=xrandr
pkgname=xorg-${_pkgname}
pkgver=1.5.0
vcs=git
gittag=${_pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
