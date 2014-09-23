#!/bin/sh

pkgname=gimp
pkgver=2.8.14
urls="http://download.gimp.org/pub/gimp/v2.8/gimp-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-gvfs \
    --without-dbus \
    --with-gimpdir=.config/gimp
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
