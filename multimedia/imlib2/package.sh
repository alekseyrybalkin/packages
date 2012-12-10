#!/bin/sh

pkgname=imlib2
pkgver=1.4.5
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
