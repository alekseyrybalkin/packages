#!/bin/sh

pkgname=poppler
pkgver=0.24.0
urls="http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz"
srctar=poppler-${pkgver}.tar.xz
srcdir=${location}/poppler-${pkgver}

kiin_make() {
  ./configure --prefix=/usr     \
              --sysconfdir=/etc \
              --enable-zlib     \
              --disable-static  \
              --enable-xpdf-headers \
              --disable-poppler-qt4
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
