#!/bin/sh

pkgname=unrar
pkgver=5.0.2
urls="http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz"
srctar=${pkgname}src-${pkgver}.tar.gz
srcdir=${location}/${pkgname}

kiin_make() {
  make -f makefile CXXFLAGS="-fPIC ${CXXFLAGS}" STRIP="true"
}

kiin_install() {
  install -Dm755 unrar ${pkgdir}/usr/bin/unrar
}
