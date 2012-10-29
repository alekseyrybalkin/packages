#!/bin/sh

pkgname=python2-cairo
pkgver=1.8.10
urls="http://cairographics.org/releases/py2cairo-${pkgver}.tar.gz"
srctar=py2cairo-${pkgver}.tar.gz
srcdir=${location}/pycairo-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
