#!/bin/sh

pkgname=libcap
pkgver=2.22
urls="http://ftp.de.debian.org/debian/pool/main/libc/libcap2/libcap2_${pkgver}.orig.tar.gz"
srctar=${pkgname}2_${pkgver}.orig.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} RAISE_SETFCAP=no install
}
