#!/bin/sh

pkgname=alsa-lib
pkgver=1.0.26
urls="http://gentoo.nixsolutions.com/distfiles/alsa-lib-1.0.26.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
