#!/bin/sh

pkgname=atkmm
_majorver=2.24
pkgver=${_majorver}.2
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/atkmm/${_majorver}/atkmm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
