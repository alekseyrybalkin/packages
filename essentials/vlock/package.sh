#!/bin/sh

pkgname=vlock
pkgver=2.2.3
urls="http://rybalkin.org/kiin-files/vlock-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-shadow=yes
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} VLOCK_GROUP=129 install
}

kiin_after_install() {
  getent group vlock >/dev/null || groupadd -g 129 vlock
}

kiin_after_upgrade() {
  kiin_after_install
}
