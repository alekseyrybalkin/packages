#!/bin/sh

pkgname=pangomm
_majorver=2.40
pkgver=${_majorver}.0
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/pangomm/${_majorver}/pangomm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
