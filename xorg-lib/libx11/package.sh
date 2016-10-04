#!/bin/sh

pkgname=libx11
pkgver=1.6.3
vcs=git
gittag=libX11-${pkgver}
srcdir=${location}/libX11-${pkgver}

kiin_make() {
    git cherry-pick 8ea762f
    git cherry-pick 8c29f16
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
