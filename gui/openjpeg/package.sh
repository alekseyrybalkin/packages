#!/bin/sh

pkgname=openjpeg
pkgver=1.5.2
urls="http://downloads.sourceforge.net/openjpeg.mirror/openjpeg-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -f -i
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
