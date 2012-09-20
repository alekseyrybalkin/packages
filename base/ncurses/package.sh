#!/bin/sh

pkgname=ncurses
pkgver=5.9
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --mandir=/usr/share/man --with-shared \
              --without-debug --enable-widec                      \
              --with-install-prefix=${pkgdir}
  make
}

kiin_install() {
  make install
  mkdir -pv ${pkgdir}/lib
  mv -v ${pkgdir}/usr/lib/libncursesw.so.5* ${pkgdir}/lib
  ln -sfv ../../lib/libncursesw.so.5 ${pkgdir}/usr/lib/libncursesw.so
  for lib in ncurses form panel menu ; do \
      rm -vf ${pkgdir}/usr/lib/lib${lib}.so ; \
      echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib/lib${lib}.so ; \
      ln -sfv lib${lib}w.a ${pkgdir}/usr/lib/lib${lib}.a ; \
  done
  ln -sfv libncurses++w.a ${pkgdir}/usr/lib/libncurses++.a
  rm -vf ${pkgdir}/usr/lib/libcursesw.so
  echo "INPUT(-lncursesw)" > ${pkgdir}/usr/lib/libcursesw.so
  ln -sfv libncurses.so ${pkgdir}/usr/lib/libcurses.so
  ln -sfv libncursesw.a ${pkgdir}/usr/lib/libcursesw.a
  ln -sfv libncurses.a ${pkgdir}/usr/lib/libcurses.a
  mkdir -pv      ${pkgdir}/usr/share/doc/ncurses-5.9
  cp -v -R doc/* ${pkgdir}/usr/share/doc/ncurses-5.9
}
