#!/bin/sh

pkgname=imlib2
pkgver=1.4.6
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/DGifOpen/s:fd:&, NULL:' src/modules/loaders/loader_gif.c
  sed -i 's/@my_libs@//' imlib2-config.in
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
