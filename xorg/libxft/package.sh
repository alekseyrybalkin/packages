#!/bin/sh

pkgname=libxft
pkgver=2.3.3
vcs=git
gittag=libXft-${pkgver}
relmon_id=1777

build() {
    sed -i -e 's/<freetype/<freetype2/g' src/xftglyphs.c
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
