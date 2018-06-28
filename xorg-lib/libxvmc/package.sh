#!/bin/sh

pkgname=libxvmc
pkgver=1.0.10
vcs=git
gittag=libXvMC-${pkgver}
relmon_id=1796

undead_make() {
    ./autogen.sh $XORG_CONFIG
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
