#!/bin/sh

pkgname=libsigc++
_majorver=2.8
pkgver=${_majorver}.0
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/libsigc++/${_majorver}/libsigc++-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
