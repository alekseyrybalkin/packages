#!/bin/sh

pkgname=gmp
pkgver=5.0.5
urls="http://ftp.gnu.org/gnu/gmp/gmp-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-cxx --enable-mpbsd
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/gmp-${pkgver}
  cp    -v doc/{isa_abi_headache,configuration} doc/*.html \
          ${pkgdir}/usr/share/doc/gmp-${pkgver}
}
