#!/bin/sh

_pkgname=encodings
pkgname=xorg-fonts-${_pkgname}
pkgver=1.0.5
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
