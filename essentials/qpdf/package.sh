#!/bin/sh

pkgname=qpdf
pkgver=5.0.0
urls="http://downloads.sourceforge.net/qpdf/qpdf-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/qpdf
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
