#!/bin/sh

pkgname=libxft
pkgver=2.3.2
vcs=git
gittag=libXft-${pkgver}
srcdir=${location}/libXft-${pkgver}
relmon_id=1777

kiin_make() {
    sed -i -e 's/<freetype/<freetype2/g' src/xftglyphs.c
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
