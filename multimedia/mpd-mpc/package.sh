#!/bin/sh

pkgname=mpd-mpc
pkgver=0.23
urls="http://www.musicpd.org/download/mpc/0/mpc-${pkgver}.tar.bz2"
srctar=mpc-${pkgver}.tar.bz2
srcdir=${location}/mpc-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
