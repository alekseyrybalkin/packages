#!/bin/sh

pkgname=librsvg
pkgver=2.36.4
urls=" http://ftp.gnome.org/pub/gnome/sources/librsvg/2.36/librsvg-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --disable-introspection
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
