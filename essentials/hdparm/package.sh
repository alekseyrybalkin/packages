#!/bin/sh

pkgname=hdparm
pkgver=9.42
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install

  # previous or that? can't remember:
  #make binprefix=/usr/ install
}
