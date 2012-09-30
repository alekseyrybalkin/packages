#!/bin/sh

pkgname=gdk-pixbuf
pkgver=2.26.4
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.26/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-x11
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # AFTER INSTALL: gdk-pixbuf-query-loaders --update-cache
}
