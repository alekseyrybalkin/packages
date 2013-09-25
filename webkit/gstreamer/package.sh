#!/bin/sh

pkgname=gstreamer
pkgver=1.2.0
extension=xz
folder="http://gstreamer.freedesktop.org/src/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-package-name="GStreamer ${pkgver} kiin" \
    --with-package-origin="http://git.rybalkin.org/?p=kiin"
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
