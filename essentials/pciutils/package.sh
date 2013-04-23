#!/bin/sh

pkgname=pciutils
pkgver=3.2.0
urls="http://ftp.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make PREFIX=/usr \
    SHAREDIR=/usr/share/misc \
    MANDIR=/usr/share/man \
    SHARED=yes \
    ZLIB=no all
}

kiin_install() {
  make PREFIX=/usr \
    SHAREDIR=/usr/share/misc \
    MANDIR=/usr/share/man \
    SHARED=yes \
    ZLIB=no \
    DESTDIR=${pkgdir} install install-lib
}
