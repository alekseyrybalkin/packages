#!/bin/sh

pkgname=links
pkgver=2.7
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -d -m755 ${pkgdir}/usr/share/doc/links-2.7
  install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
      ${pkgdir}/usr/share/doc/links-2.7
}
