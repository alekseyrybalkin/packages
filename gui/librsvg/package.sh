#!/bin/sh

pkgname=librsvg
pkgver=2.37.0
urls=" http://ftp.gnome.org/pub/gnome/sources/librsvg/2.37/librsvg-${pkgver}.tar.xz"
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

kiin_after_install() {
  gdk-pixbuf-query-loaders --update-cache
}

kiin_after_upgrade() {
  kiin_after_install
}
