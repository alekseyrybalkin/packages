#!/bin/sh

pkgname=alsa-lib
pkgver=1.0.26
urls="http://gentoo.nixsolutions.com/distfiles/alsa-lib-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --libdir=$LIBDIR --disable-python
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
