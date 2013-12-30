#!/bin/sh

pkgname=giblib
pkgver=1.2.4
urls="http://linuxbrit.co.uk/downloads/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} docsdir=/usr/share/doc/giblib install
}
