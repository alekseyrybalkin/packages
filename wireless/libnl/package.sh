#!/bin/sh

pkgname=libnl
pkgver=3.2.13
urls="http://www.infradead.org/~tgr/${pkgname}/files/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
