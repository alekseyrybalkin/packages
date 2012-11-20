#!/bin/sh

pkgname=slang
pkgver=2.2.4
urls="ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install-all
}
