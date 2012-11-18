#!/bin/sh

pkgname=apr
pkgver=1.4.6
urls="http://archive.apache.org/dist/apr/apr-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static \
    --with-installbuilddir=/usr/share/apr-1/build
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
