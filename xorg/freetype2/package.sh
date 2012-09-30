#!/bin/sh

pkgname=freetype2
pkgver=2.4.10
urls="http://downloads.sourceforge.net/freetype/freetype-${pkgver}.tar.bz2"
srctar=freetype-${pkgver}.tar.bz2
srcdir=${location}/freetype-${pkgver}

kiin_make() {
  sed -i -r 's:.*(#.*SUBPIXEL.*) .*:\1:' \
    include/freetype/config/ftoption.h
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
