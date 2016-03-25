#!/bin/sh

pkgname=cairomm
pkgver=1.12.0
vcs=git
gittag=${pkgver}
urls="http://cairographics.org/releases/cairomm-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
