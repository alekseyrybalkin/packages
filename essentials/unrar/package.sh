#!/bin/sh

pkgname=unrar
pkgver=4.2.4
urls="http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz"
srctar=${pkgname}src-${pkgver}.tar.gz
srcdir=${location}/${pkgname}

kiin_make() {
  make -f makefile.unix
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/bin
  install -v -m755 unrar ${pkgdir}/usr/bin
}
