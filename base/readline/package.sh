#!/bin/sh

pkgname=readline
pkgver=6.3
urls="http://ftp.gnu.org/gnu/readline/readline-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/MV.*old/d' Makefile.in
  sed -i '/{OLDSUFF}/c:' support/shlib-install
  ./configure --prefix=/usr --libdir=/usr/lib
  make SHLIB_LIBS=-lncurses
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/readline
  install -v -m644 doc/*.{ps,pdf,html,dvi} \
    ${pkgdir}/usr/share/doc/readline
}
