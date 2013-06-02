#!/bin/sh

pkgname=icu
pkgver=51.2
_pkgver=51_2
urls="http://download.icu-project.org/files/icu4c/51.2/icu4c-${_pkgver}-src.tgz"
srctar=icu4c-${_pkgver}-src.tgz
srcdir=${location}/icu

kiin_make() {
  cd source
  ./configure --prefix=/usr
  make
}

kiin_install() {
  cd source
  make DESTDIR=${pkgdir} install
}
