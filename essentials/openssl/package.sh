#!/bin/sh

pkgname=openssl
pkgver=1.0.1c
urls="http://www.openssl.org/source/openssl-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/openssl-${pkgver}-fix_manpages-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -Np1 -i ../openssl-${pkgver}-fix_manpages-1.patch
  ./config --prefix=/usr zlib-dynamic --openssldir=/etc/ssl shared
  make
  # to disable static libraries, did not done that. why?
  #sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
}

kiin_install() {
  make INSTALL_PREFIX=${pkgdir} MANDIR=/usr/share/man install
  install -v -d -m755 ${pkgdir}/usr/share/doc/openssl-${pkgver}
  cp -v -r doc/{HOWTO,README,*.{txt,html,gif}}      \
      ${pkgdir}/usr/share/doc/openssl-${pkgver}
}
