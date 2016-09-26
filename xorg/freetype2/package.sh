#!/bin/sh

pkgname=freetype2
pkgver=2.7
vcs=git
gittag=VER-${pkgver//\./-}
srcdir=${location}/freetype-${pkgver}

kiin_make() {
    ./autogen.sh
    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
    sed -r "s:.*(#.*SUBPIXEL_(RENDERING|HINTING 2)) .*:\1:g" -i include/freetype/config/ftoption.h
    if [ -z "${KIIN_LIB32}" ]; then
        ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    else
        ./configure --prefix=/usr --disable-static --with-harfbuzz=no --libdir=$LIBDIR
    fi
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
