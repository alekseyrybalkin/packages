#!/bin/sh

pkgname=scrot
pkgver=0.8
urls="http://linuxbrit.co.uk/downloads/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} docsdir=/usr/share/doc/scrot install
}
