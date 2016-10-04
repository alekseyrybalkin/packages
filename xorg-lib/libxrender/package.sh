#!/bin/sh

pkgname=libxrender
pkgver=0.9.9
vcs=git
gittag=libXrender-${pkgver}
srcdir=${location}/libXrender-${pkgver}

kiin_make() {
    git cherry-pick 9362c7d
    git cherry-pick 8fad00b
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
