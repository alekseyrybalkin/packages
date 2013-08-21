#!/bin/sh

pkgname=gstreamer
pkgver=1.0.9
urls="http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # fix build with bison 3.0
  sed -i '/int priv_gst_parse_yylex/s/, yyscan_t yyscanner//' \
    gst/parse/grammar.y
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-package-name="GStreamer ${pkgver} kiin" \
    --with-package-origin="http://git.rybalkin.org/?p=kiin"
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
