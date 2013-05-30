#!/bin/sh

pkgname=freetype2
pkgver=2.4.12
urls="http://downloads.sourceforge.net/freetype/freetype-${pkgver}.tar.bz2"
srctar=freetype-${pkgver}.tar.bz2
srcdir=${location}/freetype-${pkgver}

kiin_make() {
  sed -e "s@FT_CFF_HINTING_FREETYPE@FT_CFF_HINTING_ADOBE@" \
    -i src/cff/cffobjs.c
  sed -e "/AUX.*.gxvalid/s@^# @@" -e "/AUX.*.otvalid/s@^# @@" \
    -i modules.cfg
  sed -e "/#.*.SUBPIXEL/s@/\* @@" -e "/#.*.SUBPIXEL/s@ \*/@@" \
    -i include/freetype/config/ftoption.h
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
