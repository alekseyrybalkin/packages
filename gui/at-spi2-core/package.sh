#!/bin/sh

pkgname=at-spi2-core
pkgver=2.9.2
urls="http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/2.9/at-spi2-core-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/at-spi2-core
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
