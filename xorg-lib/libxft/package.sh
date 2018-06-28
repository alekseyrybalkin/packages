#!/bin/sh

pkgname=libxft
pkgver=2.3.2
vcs=git
gittag=libXft-${pkgver}
relmon_id=1777

undead_make() {
    sed -i -e 's/<freetype/<freetype2/g' src/xftglyphs.c
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
