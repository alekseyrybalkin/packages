#!/bin/sh

pkgname=pciutils
pkgver=3.2.0
extension=xz
folder="https://ftp.kernel.org/pub/software/utils/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  make PREFIX=/usr \
    SHAREDIR=/usr/share/misc \
    MANDIR=/usr/share/man \
    SHARED=yes all
}

kiin_install() {
  make PREFIX=/usr \
    SHAREDIR=/usr/share/misc \
    MANDIR=/usr/share/man \
    SHARED=yes \
    DESTDIR=${pkgdir} install install-lib
}
