#!/bin/sh

pkgname=vlock
pkgver=2.2.3
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/AUTH_METHOD=\"pam\"/AUTH_METHOD=\"shadow\"/g' configure
  ./configure --prefix=/usr --enable-shadow=yes
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} VLOCK_GROUP=129 install
}
