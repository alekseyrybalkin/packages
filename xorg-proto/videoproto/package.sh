#!/bin/sh

pkgname=videoproto
pkgver=2.3.3
vcs=git
gittag=${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
