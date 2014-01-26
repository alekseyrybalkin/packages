#!/bin/sh

pkgname=fluxbox
pkgver=1.3.5
urls="http://downloads.sourceforge.net/fluxbox/fluxbox-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --disable-imlib2
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
