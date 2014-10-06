#!/bin/sh

pkgname=icu
pkgver=54.1
_pkgver=54_1
urls="http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${_pkgver}-src.tgz"
srctar=icu4c-${_pkgver}-src.tgz
srcdir=${location}/icu

kiin_make() {
  cd source
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

kiin_install() {
  cd source
  make DESTDIR=${pkgdir} install
}
