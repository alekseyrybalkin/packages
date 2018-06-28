#!/bin/sh

pkgname=fixesproto
pkgver=5.0
ARCH_VERSION=5.0+9+g4292ec1
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=13471

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
