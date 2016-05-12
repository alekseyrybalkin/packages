#!/bin/sh

_pkgname=mkfontscale
pkgname=xorg-${_pkgname}
pkgver=1.1.2
vcs=git
gittag=${_pkgname}-${pkgver}
srcdir=${location}/${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
