#!/bin/sh

pkgname=mpg123
pkgver=1.17.0
urls="http://downloads.sourceforge.net/mpg123/mpg123-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=/usr \
      --disable-static
  else
    ./configure --prefix=/usr \
      --with-audio="alsa" \
      --with-cpu=i586 \
      --libdir=/usr/lib32
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
