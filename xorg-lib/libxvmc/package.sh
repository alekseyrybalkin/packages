#!/bin/sh

pkgname=libxvmc
pkgver=1.0.9
vcs=git
gittag=libXvMC-${pkgver}
srcdir=${location}/libXvMC-${pkgver}

kiin_make() {
    git cherry-pick 2cd95e7
    ./autogen.sh $XORG_CONFIG
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
