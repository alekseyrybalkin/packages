#!/bin/sh

pkgname=glib
pkgver=2.34.1
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.34/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
