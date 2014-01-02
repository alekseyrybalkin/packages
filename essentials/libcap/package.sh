#!/bin/sh

pkgname=libcap
pkgver=2.23
extension=xz
folder="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/"
check_server=1

. ${KIIN_REPO}/defaults.sh

urls="${urls} http://rybalkin.org/kiin-files/libcap-${pkgver}-header.patch"

kiin_make() {
  patch -p1 -i ${KIIN_HOME}/tarballs/libcap-${pkgver}-header.patch
  sed -i "s#uapi/##" libcap/Makefile
  sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
  make
}

kiin_install() {
  make prefix=/usr lib=/lib DESTDIR=${pkgdir} RAISE_SETFCAP=no install
  chmod -v 755 ${pkgdir}/usr/lib/libcap.so
  mv ${pkgdir}/usr/{sbin,bin}
}
