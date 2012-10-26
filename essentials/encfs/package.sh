#!/bin/sh

pkgname=encfs
pkgver=1.7.4
urls="http://encfs.googlecode.com/files/${pkgname}-${pkgver}.tgz"
srctar=${pkgname}-${pkgver}.tgz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
