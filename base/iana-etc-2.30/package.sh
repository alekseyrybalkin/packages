#!/bin/sh

pkgname=iana-etc
pkgver=2.30
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
