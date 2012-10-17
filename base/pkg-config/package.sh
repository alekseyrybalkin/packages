#!/bin/sh

pkgname=pkg-config
pkgver=0.27.1
urls="http://pkgconfig.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr         \
              --with-internal-glib  \
              --docdir=/usr/share/doc/${pkgname}-${pkgver}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
