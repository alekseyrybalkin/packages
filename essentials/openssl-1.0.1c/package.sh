#!/bin/sh

pkgname=openssl
pkgver=1.0.1c
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -Np1 -i ../openssl-1.0.1c-fix_manpages-1.patch
  ./config --prefix=/usr zlib-dynamic --openssldir=/etc/ssl shared
  make
  # to disable static libraries, did not done that. why?
  #sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
}

kiin_install() {
  make INSTALL_PREFIX=${pkgdir} MANDIR=/usr/share/man install
  mkdir -pv ${pkgdir}/usr/lib
  mv -v ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rm -r ${pkgdir}/usr/lib64
  ln -sv lib ${pkgdir}/usr/lib64
  install -v -d -m755 ${pkgdir}/usr/share/doc/openssl-1.0.1c
  cp -v -r doc/{HOWTO,README,*.{txt,html,gif}}      \
      ${pkgdir}/usr/share/doc/openssl-1.0.1c
}
