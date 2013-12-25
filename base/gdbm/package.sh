#!/bin/sh

pkgname=gdbm
pkgver=1.11
urls="http://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-libgdbm-compat
  make
}

kiin_install() {
  make prefix=${pkgdir}/usr install
}
