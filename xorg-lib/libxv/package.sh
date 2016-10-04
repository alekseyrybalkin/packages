#!/bin/sh

pkgname=libxv
pkgver=1.0.10
vcs=git
gittag=libXv-${pkgver}
srcdir=${location}/libXv-${pkgver}

kiin_make() {
    git cherry-pick d9da580
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
