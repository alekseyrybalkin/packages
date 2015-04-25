#!/bin/sh

pkgname=icu
pkgver=55.1
_pkgver=55_1
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
