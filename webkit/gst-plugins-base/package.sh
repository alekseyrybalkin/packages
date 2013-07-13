#!/bin/sh

pkgname=gst-plugins-base
pkgver=1.0.8
urls="http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --with-package-name="GStreamer Base Plugins ${pkgver} kiin" \
    --with-package-origin="http://git.rybalkin.org/?p=kiin"
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
