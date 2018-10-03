#!/bin/sh

_pkgname=xset
pkgname=xorg-${_pkgname}
pkgver=1.2.4
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
