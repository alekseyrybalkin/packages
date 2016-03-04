#!/bin/sh

pkgname=flex
pkgver=2.6.0
urls="http://prdownloads.sourceforge.net/flex/flex-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/${pkgname}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sv flex ${pkgdir}/usr/bin/lex
}
