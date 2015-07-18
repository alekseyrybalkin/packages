#!/bin/sh

pkgname=flex
pkgver=2.5.39
urls="http://prdownloads.sourceforge.net/flex/flex-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
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
