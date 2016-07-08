#!/bin/sh

pkgname=freetype2
pkgver=2.6.4
vcs=git
gittag=VER-${pkgver//\./-}
srcdir=${location}/freetype-${pkgver}

kiin_make() {
    ./autogen.sh
    sed -e "/AUX.*.gxvalid/s@^# @@" -e "/AUX.*.otvalid/s@^# @@" \
        -i modules.cfg
    sed -e "/#.*.SUBPIXEL/s@/\* @@" -e "/#.*.SUBPIXEL/s@ \*/@@" \
        -i include/freetype/config/ftoption.h
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
