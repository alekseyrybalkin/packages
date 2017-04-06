#!/bin/sh

pkgname=freetype2
pkgver=2.7.1
vcs=git
gittag=VER-${pkgver//\./-}
srcdir=${location}/freetype-${pkgver}
relmon_id=854

kiin_make() {
    ./autogen.sh
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
    sed -r "s:.*(#.*SUBPIXEL_(RENDERING|HINTING 2)) .*:\1:g" -i include/freetype/config/ftoption.h
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
