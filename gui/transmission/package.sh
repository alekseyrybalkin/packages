#!/bin/sh

pkgname=transmission
pkgver=2.60
urls="http://download.transmissionbt.com/files/transmission-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --with-gtk
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
