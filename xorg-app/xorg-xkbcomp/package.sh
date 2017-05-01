#!/bin/sh

_pkgname=xkbcomp
pkgname=xorg-${_pkgname}
pkgver=1.4.0
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
