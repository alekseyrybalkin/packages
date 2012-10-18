#!/bin/sh

pkgname=poppler
pkgver=0.20.4
urls="http://poppler.freedesktop.org/poppler-${pkgver}.tar.gz"
srctar=poppler-${pkgver}.tar.gz
srcdir=${location}/poppler-${pkgver}

kiin_make() {
  ./configure --prefix=/usr     \
              --sysconfdir=/etc \
              --enable-zlib     \
              --disable-static  \
              --enable-xpdf-headers
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
