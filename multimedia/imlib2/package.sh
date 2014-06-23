#!/bin/sh

pkgname=imlib2
pkgver=1.4.6
urls="http://downloads.sourceforge.net/enlightenment/imlib2-${pkgver}.tar.bz2 \
  http://rybalkin.org/kiin-files/imlib2-giflib51.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/imlib2-giflib51.patch
  sed -i 's/@my_libs@//' imlib2-config.in
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
