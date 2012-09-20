#!/bin/sh

pkgname=iproute2
pkgver=3.5.1
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/^TARGETS/s@arpd@@g' misc/Makefile
  sed -i /ARPD/d Makefile
  sed -i 's/arpd.8//' man/man8/Makefile
  make DESTDIR=
}

kiin_install() {
  make DESTDIR=${pkgdir}              \
      MANDIR=/usr/share/man           \
      DOCDIR=/usr/share/doc/iproute2-3.5.1 install
}
