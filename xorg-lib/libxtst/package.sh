#!/bin/sh

pkgname=libxtst
pkgver=1.2.2
vcs=git
gittag=libXtst-${pkgver}
srcdir=${location}/libXtst-${pkgver}

kiin_make() {
    git cherry-pick 9556ad6
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
