#!/bin/sh

_pkgname=xbacklight
pkgname=xorg-${_pkgname}
pkgver=1.2.2
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=5161

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
