#!/bin/sh

pkgname=glibmm
_majorver=2.48
pkgver=${_majorver}.1
vcs=git
gittag=${pkgver}
urls="http://ftp.gnome.org/pub/gnome/sources/glibmm/${_majorver}/glibmm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
