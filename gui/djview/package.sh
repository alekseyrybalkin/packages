#!/bin/sh

pkgname=djview
pkgver=4.8
urls="http://downloads.sourceforge.net/djvu/djview-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed 's/swap/rofl_swap/g' -i src/qdjvuwidget.cpp
  QTDIR=/usr ./configure --prefix=/usr \
    --disable-nsdejavu \
    --disable-desktopfiles
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install-djview
}
