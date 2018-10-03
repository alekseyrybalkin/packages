#!/bin/sh

pkgname=resourceproto
pkgver=1.2.0
vcs=git
gittag=${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
