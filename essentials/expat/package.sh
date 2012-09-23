#!/bin/sh

pkgname=expat
pkgver=2.1.0
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/expat-2.1.0
  install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat-2.1.0
}
