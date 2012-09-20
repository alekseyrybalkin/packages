#!/bin/sh

pkgname=glib
pkgver=2.32.4
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system &&
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
