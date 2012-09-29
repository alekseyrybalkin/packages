#!/bin/sh

pkgname=libmpdclient
pkgver=2.7
urls="http://downloads.sourceforge.net/project/musicpd/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
