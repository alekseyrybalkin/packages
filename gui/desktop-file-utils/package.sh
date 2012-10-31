#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.21
urls=" http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
