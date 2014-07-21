#!/bin/sh

pkgname=iproute2
pkgver=3.15.0
urls="http://www.kernel.org/pub/linux/utils/net/${pkgname}/${pkgname}-${pkgver}.tar.xz"
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
      DOCDIR=/usr/share/doc/${pkgname} install
  mv ${pkgdir}/{sbin,usr/bin}
}
