#!/bin/sh

pkgname=parted
pkgver=3.1
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
