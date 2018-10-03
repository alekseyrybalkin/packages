#!/bin/sh

pkgname=recordproto
pkgver=1.14.2
vcs=git
gittag=${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
