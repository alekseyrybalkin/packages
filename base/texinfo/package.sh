#!/bin/sh

pkgname=texinfo
pkgver=6.0
urls="http://ftp.gnu.org/gnu/texinfo/texinfo-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

known="usr/share/info/dir"
