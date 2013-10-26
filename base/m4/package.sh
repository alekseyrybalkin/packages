#!/bin/sh

pkgname=m4
pkgver=1.4.17
urls="http://ftp.gnu.org/gnu/m4/m4-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' lib/stdio.in.h
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make prefix=${pkgdir}/usr install
}
