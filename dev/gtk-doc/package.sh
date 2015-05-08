#!/bin/sh

pkgname=gtk-doc
pkgver=1.22
urls="http://ftp.gnome.org/pub/gnome/sources/gtk-doc/${pkgver}/gtk-doc-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -p1 -i ../fix-bottom-style.diff
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
