#!/bin/sh

pkgname=pango
pkgver=1.32.2
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.32/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # AFTER INSTALL: pango-querymodules --update-cache
}
