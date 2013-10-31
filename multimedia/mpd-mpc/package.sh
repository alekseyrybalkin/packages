#!/bin/sh

pkgname=mpd-mpc
pkgver=0.24
urls="http://www.musicpd.org/download/mpc/0/mpc-${pkgver}.tar.xz"
srctar=mpc-${pkgver}.tar.xz
srcdir=${location}/mpc-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
