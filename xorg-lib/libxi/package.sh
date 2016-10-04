#!/bin/sh

pkgname=libxi
pkgver=1.7.6
vcs=git
gittag=libXi-${pkgver}
srcdir=${location}/libXi-${pkgver}

kiin_make() {
    git cherry-pick 19a9cd6
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
