#!/bin/sh

pkgname=xlockmore
pkgver=5.42
urls="http://www.tux.org/~bagleyd/xlock/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --enable-appdefaultdir=/usr/share/X11/app-defaults \
    --with-gtk2 \
    --without-esound \
    --without-ftgl
  make
}

kiin_install() {
  make xapploaddir=${pkgdir}/usr/share/X11/app-defaults \
    mandir=${pkgdir}/usr/man/man1 \
    prefix=${pkgdir}/usr install
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/
}
