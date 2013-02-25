#!/bin/sh

pkgname=openssl
pkgver=1.0.1e
urls="http://www.openssl.org/source/openssl-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/openssl-${pkgver}-fix_manpages-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -Np1 -i ../openssl-${pkgver}-fix_manpages-1.patch
  if [ -z "$KIIN_LIB32" ]; then
    ./config --prefix=/usr \
      zlib-dynamic \
      --openssldir=/etc/ssl \
      shared
  else
    ./Configure --prefix=/usr \
      zlib-dynamic \
      --openssldir=/etc/ssl \
      shared \
      linux-elf \
      --libdir=lib32
  fi
  make
}

kiin_install() {
  MAKEFLAGS=
  make INSTALL_PREFIX=${pkgdir} MANDIR=/usr/share/man install
  install -v -d -m755 ${pkgdir}/usr/share/doc/openssl-${pkgver}
  cp -v -r doc/{HOWTO,README,*.{txt,html,gif}}      \
      ${pkgdir}/usr/share/doc/openssl-${pkgver}
}
