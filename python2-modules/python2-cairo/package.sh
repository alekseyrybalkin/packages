#!/bin/sh

pkgname=python2-cairo
pkgver=1.10.0
urls="http://cairographics.org/releases/py2cairo-${pkgver}.tar.bz2"
srctar=py2cairo-${pkgver}.tar.bz2
srcdir=${location}/py2cairo-${pkgver}

kiin_make() {
  ./waf configure --prefix=/usr
  ./waf build
}

kiin_install() {
  ./waf install --destdir=${pkgdir}
}
