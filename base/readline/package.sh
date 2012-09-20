#!/bin/sh

pkgname=readline
pkgver=6.2
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/MV.*old/d' Makefile.in
  sed -i '/{OLDSUFF}/c:' support/shlib-install
  patch -Np1 -i ../readline-6.2-fixes-1.patch
  ./configure --prefix=/usr --libdir=/lib
  make SHLIB_LIBS=-lncurses
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/lib
  mv -v ${pkgdir}/lib/lib{readline,history}.a ${pkgdir}/usr/lib
  rm -v ${pkgdir}/lib/lib{readline,history}.so
  ln -sfv ../../lib/libreadline.so.6 ${pkgdir}/usr/lib/libreadline.so
  ln -sfv ../../lib/libhistory.so.6 ${pkgdir}/usr/lib/libhistory.so
  mkdir   -pv      ${pkgdir}/usr/share/doc/readline-6.2
  install -v -m644 doc/*.{ps,pdf,html,dvi} \
                   ${pkgdir}/usr/share/doc/readline-6.2
}
