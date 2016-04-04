#!/bin/sh

pkgname=alsa-lib
pkgver=1.1.0
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --libdir=$LIBDIR --disable-python
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
