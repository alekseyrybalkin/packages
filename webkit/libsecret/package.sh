#!/bin/sh

pkgname=libsecret
pkgver=0.15
urls="http://ftp.gnome.org/pub/gnome/sources/libsecret/${pkgver}/libsecret-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-static --disable-gcrypt
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
