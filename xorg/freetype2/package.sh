#!/bin/sh

pkgname=freetype2
pkgver=2.4.12
urls="http://downloads.sourceforge.net/freetype/freetype-${pkgver}.tar.bz2"
srctar=freetype-${pkgver}.tar.bz2
srcdir=${location}/freetype-${pkgver}

kiin_make() {
  sed -i -r 's:.*(#.*SUBPIXEL_RENDERING.*) .*:\1:' \
    include/freetype/config/ftoption.h
  sed -i -e '1059d' src/cff/cffobjs.c
  sed -i -e '1058adriver->hinting_engine = FT_CFF_HINTING_ADOBE;' src/cff/cffobjs.c
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
