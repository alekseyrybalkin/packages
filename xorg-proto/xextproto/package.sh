#!/bin/sh

pkgname=xextproto
pkgver=7.3.0
vcs=git
gittag=${pkgname}-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
