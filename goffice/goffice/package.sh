#!/bin/sh

pkgname=goffice
pkgver=0.10.20
urls="http://ftp.gnome.org/pub/gnome/sources/goffice/0.10/goffice-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
