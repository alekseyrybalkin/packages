#!/bin/sh

pkgname=bash
pkgver=4.3
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
              --htmldir=/usr/share/doc/bash \
              --without-bash-malloc \
              --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv bash ${pkgdir}/usr/bin/sh
}
