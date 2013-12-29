#!/bin/sh

pkgname=libcap
pkgver=2.23
extension=xz
folder="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
  make
}

kiin_install() {
  make prefix=/usr lib=/lib DESTDIR=${pkgdir} RAISE_SETFCAP=no install
  chmod -v 755 ${pkgdir}/usr/lib/libcap.so
  mv ${pkgdir}/usr/{sbin,bin}
}
