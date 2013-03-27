#!/bin/sh

pkgname=gdk-pixbuf
pkgver=2.28.0
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.28/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-x11 --libdir=$LIBDIR
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
