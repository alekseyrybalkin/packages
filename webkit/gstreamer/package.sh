#!/bin/sh

pkgname=gstreamer
pkgver=1.0.9
urls="http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

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
