#!/bin/sh

pkgname=libdaemon
pkgver=0.14
urls="http://0pointer.de/lennart/projects/libdaemon/libdaemon-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
