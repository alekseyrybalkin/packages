#!/bin/sh

pkgname=pango
pkgver=1.32.5
urls="http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.32/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  pango-querymodules --update-cache
}

kiin_after_upgrade() {
  kiin_after_install
}
