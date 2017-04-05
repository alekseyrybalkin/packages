#!/bin/sh

pkgname=libxvmc
pkgver=1.0.10
vcs=git
gittag=libXvMC-${pkgver}
srcdir=${location}/libXvMC-${pkgver}
relmon_id=1796

kiin_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
