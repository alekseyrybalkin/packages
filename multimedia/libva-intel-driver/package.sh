#!/bin/sh

pkgname=libva-intel-driver
pkgver=1.6.2
extension=bz2
folder="http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  mkdir -p m4
  autoreconf -fi
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
