#!/bin/sh

pkgname=mpfr
_pkgver=3.1.2
pkgver=${_pkgver}.p11
urls="http://www.mpfr.org/mpfr-${_pkgver}/mpfr-${_pkgver}.tar.xz \
  http://www.linuxfromscratch.org/patches/lfs/development/mpfr-${_pkgver}-upstream_fixes-3.patch"
srctar=${pkgname}-${_pkgver}.tar.xz
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/mpfr-${_pkgver}-upstream_fixes-3.patch
  ./configure --prefix=/usr \
    --enable-thread-safe \
    --docdir=/usr/share/doc/mpfr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make html
  make DESTDIR=${pkgdir} install-html
}
