#!/bin/sh

pkgname=readline
pkgver=6.2
urls="http://ftp.gnu.org/gnu/readline/readline-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/readline-${pkgver}-fixes-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/MV.*old/d' Makefile.in
  sed -i '/{OLDSUFF}/c:' support/shlib-install
  patch -Np1 -i ../readline-${pkgver}-fixes-1.patch
  ./configure --prefix=/usr --libdir=/usr/lib
  make SHLIB_LIBS=-lncurses
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/readline
  install -v -m644 doc/*.{ps,pdf,html,dvi} \
    ${pkgdir}/usr/share/doc/readline
}
