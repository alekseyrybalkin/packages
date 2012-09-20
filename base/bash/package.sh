#!/bin/sh

pkgname=bash
pkgver=4.2
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../bash-4.2-fixes-8.patch
  ./configure --prefix=/usr                     \
              --bindir=/bin                     \
              --htmldir=/usr/share/doc/bash-4.2 \
              --without-bash-malloc             \
              --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
