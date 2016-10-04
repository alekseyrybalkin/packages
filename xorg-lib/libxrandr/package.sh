#!/bin/sh

pkgname=libxrandr
pkgver=1.5.0
vcs=git
gittag=libXrandr-${pkgver}
srcdir=${location}/libXrandr-${pkgver}

kiin_make() {
    git cherry-pick a0df3e1
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
