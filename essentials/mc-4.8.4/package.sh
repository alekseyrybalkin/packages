#!/bin/sh

pkgname=mc
pkgver=4.8.4
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr     \
              --enable-charset  \
              --disable-static  \
              --sysconfdir=/etc \
              --with-screen=ncurses
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  cp -v doc/keybind-migration.txt ${pkgdir}/usr/share/mc
}
