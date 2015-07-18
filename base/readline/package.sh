#!/bin/sh

pkgname=readline
pkgver=6.3.008
vcs=git
gittag=a73b98f779b388a5d0624e02e8bb187246e3e396
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/MV.*old/d' Makefile.in
  sed -i '/{OLDSUFF}/c:' support/shlib-install
  ./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/readline
  make SHLIB_LIBS=-lncurses
}

kiin_install() {
  make DESTDIR=${pkgdir} SHLIB_LIBS=-lncurses install
  mkdir -pv ${pkgdir}/usr/share/doc/readline
  install -v -m644 doc/*.{ps,pdf,html,dvi} \
    ${pkgdir}/usr/share/doc/readline
}
