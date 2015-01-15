#!/bin/sh

pkgname=swig
pkgver=3.0.4
urls="http://prdownloads.sourceforge.net/swig/swig-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
