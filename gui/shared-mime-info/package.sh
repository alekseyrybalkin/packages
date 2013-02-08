#!/bin/sh

pkgname=shared-mime-info
pkgver=1.0
urls="http://freedesktop.org/~hadess/shared-mime-info-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  ./configure --prefix=/usr \
    --disable-update-mimedb
  make
}

kiin_install() {
  MAKEFLAGS=
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  update-mime-database /usr/share/mime
}

kiin_after_upgrade() {
  kiin_after_install
}
