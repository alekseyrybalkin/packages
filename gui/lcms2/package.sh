#!/bin/sh

pkgname=lcms2
ARCH_NAME_LIB32=lcms2
pkgver=2.5
urls="http://downloads.sourceforge.net/lcms/lcms2-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
