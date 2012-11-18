#!/bin/sh

pkgname=neon
pkgver=0.29.6
urls="http://www.webdav.org/neon/neon-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
