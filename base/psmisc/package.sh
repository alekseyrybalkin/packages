#!/bin/sh

pkgname=psmisc
pkgver=22.20
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
