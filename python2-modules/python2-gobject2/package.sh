#!/bin/sh

pkgname=python2-gobject2
pkgver=2.28.6
urls="http://ftp.gnome.org/pub/gnome/sources/pygobject/${pkgver%.*}/pygobject-${pkgver}.tar.xz"
srctar=pygobject-${pkgver}.tar.xz
srcdir=${location}/pygobject-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-introspection
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
