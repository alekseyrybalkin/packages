#!/bin/sh

pkgname=libxcb
pkgver=1.10
urls="http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -e "s/pthread-stubs//" -i configure.ac
  autoreconf -fi
  ./configure $XORG_CONFIG \
    --enable-xinput --enable-xkb \
    --docdir='${datadir}'/doc/${pkgname} \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
