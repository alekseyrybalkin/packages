#!/bin/sh

pkgname=webkitgtk
pkgver=2.1.1
urls="http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/generate-gtkdoc --rebase/s:^:# :' GNUmakefile.in
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/WebKitGTK \
    --with-gstreamer=1.0 \
    --disable-geolocation
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
