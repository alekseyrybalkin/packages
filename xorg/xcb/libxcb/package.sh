#!/bin/sh

pkgname=libxcb
pkgver=1.9
urls="http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG \
    --enable-xinput \
    --docdir='${datadir}'/doc/${pkgname}-${pkgver} \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
