#!/bin/sh

pkgname=libxfixes
pkgver=5.0.2
vcs=git
gittag=libXfixes-${pkgver}
srcdir=${location}/libXfixes-${pkgver}

kiin_make() {
    git cherry-pick 61c1039
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
