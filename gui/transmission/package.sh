#!/bin/sh

pkgname=transmission
pkgver=2.76
urls="http://download.transmissionbt.com/files/transmission-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --without-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
