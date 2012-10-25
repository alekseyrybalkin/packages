#!/bin/sh

pkgname=apr-util
pkgver=1.5.1
urls="http://archive.apache.org/dist/apr/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-apr=/usr --with-gdbm=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
