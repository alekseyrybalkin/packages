#!/bin/sh

pkgname=gst-plugins-base
pkgver=1.3.91
extension=xz
folder="http://gstreamer.freedesktop.org/src/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --with-package-name="GStreamer Base Plugins ${pkgver} kiin" \
    --with-package-origin="http://git.rybalkin.org/?p=kiin"
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
