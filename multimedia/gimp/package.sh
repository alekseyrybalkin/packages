#!/bin/sh

pkgname=gimp
pkgver=2.8.6
urls="http://artfiles.org/gimp.org/gimp/v2.8/gimp-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-gvfs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
