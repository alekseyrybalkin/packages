#!/bin/sh

_pkgname=xmodmap
pkgname=xorg-${_pkgname}
pkgver=1.0.9
vcs=git
gittag=${_pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
