#!/bin/sh

pkgname=pkg-config
pkgver=0.27
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr         \
              --with-internal-glib  \
              --docdir=/usr/share/doc/pkg-config-0.27
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
