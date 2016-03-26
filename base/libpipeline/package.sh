#!/bin/sh

pkgname=libpipeline
pkgver=1.4.1
vcs=git
gittag=${pkgver}
urls="http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
