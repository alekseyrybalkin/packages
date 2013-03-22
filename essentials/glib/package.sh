#!/bin/sh

pkgname=glib
pkgver=2.35.9
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.35/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-pcre=system \
              --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
