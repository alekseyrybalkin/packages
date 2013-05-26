#!/bin/sh

pkgname=gajim
pkgver=0.15.4
urls="http://www.gajim.org/downloads/${pkgver%.*}/gajim-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-site-packages
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
