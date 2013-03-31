#!/bin/sh

pkgname=gdb
pkgver=7.5.1
urls="http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} -C gdb install
}
