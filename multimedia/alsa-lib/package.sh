#!/bin/sh

pkgname=alsa-lib
pkgver=1.0.28
urls="ftp://ftp.alsa-project.org/pub/lib/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --libdir=$LIBDIR --disable-python
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
