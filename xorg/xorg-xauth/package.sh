#!/bin/sh

_pkgname=xauth
pkgname=xorg-${_pkgname}
pkgver=1.1
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
