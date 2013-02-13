#!/bin/sh

pkgname=feh
pkgver=2.9
urls="http://feh.finalrewind.org/feh-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make PREFIX=/usr
}

kiin_install() {
  make PREFIX=/usr DESTDIR=${pkgdir} install
}
