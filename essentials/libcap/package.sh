#!/bin/sh

pkgname=libcap
pkgver=2.22
extension=gz
folder="http://ftp.de.debian.org/debian/pool/main/libc/${pkgname}2/"
check_server=1

srctar=${pkgname}2_${pkgver}.orig.tar.${extension}

. ${KIIN_HOME}/defaults.sh

ver_grep="^${pkgname}2_.*\.orig\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}2_//g" | sed -r "s/\.orig\.tar\.${extension}$//g"
}

kiin_make() {
  sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} RAISE_SETFCAP=no install
  chmod -v 755 ${pkgdir}/lib*/libcap.so
}
