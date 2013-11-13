#!/bin/sh

pkgname=kbd
pkgver=2.0.1
urls="http://ftp.altlinux.org/pub/people/legion/kbd/kbd-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-vlock
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
