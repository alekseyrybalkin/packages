#!/bin/sh

pkgname=gdb
pkgver=7.9
urls="http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} -C gdb install
}
