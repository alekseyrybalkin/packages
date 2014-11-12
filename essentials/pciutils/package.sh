#!/bin/sh

pkgname=pciutils
pkgver=3.3.0
extension=xz
folder="https://www.kernel.org/pub/software/utils/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  make PREFIX=/usr \
    SBINDIR=/usr/bin \
    SHAREDIR=/usr/share/misc \
    SHARED=yes
}

kiin_install() {
  make PREFIX=/usr \
    SBINDIR=/usr/bin \
    SHAREDIR=/usr/share/misc \
    SHARED=yes \
    DESTDIR=${pkgdir} install install-lib
}
