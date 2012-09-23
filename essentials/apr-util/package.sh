#!/bin/sh

pkgname=apr-util
pkgver=1.4.1
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-apr=/usr --with-gdbm=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
