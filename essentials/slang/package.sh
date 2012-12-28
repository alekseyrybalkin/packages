#!/bin/sh

pkgname=slang
pkgver=2.2.4
urls="ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-png
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install-all
}
