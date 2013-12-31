#!/bin/sh

pkgname=openssl
pkgver=1.0.1e
extension=gz
folder="http://www.openssl.org/source/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  MAKEFLAGS=
  sed -i -e '2,55d' util/pod2mantest
  if [ -z "$KIIN_LIB32" ]; then
    ./config --prefix=/usr \
      --libdir=lib \
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
  sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
  make INSTALL_PREFIX=${pkgdir} MANDIR=/usr/share/man MANSUFFIX=ssl install
  install -v -d -m755 ${pkgdir}/usr/share/doc/openssl
  cp -v -r doc/{HOWTO,README,*.{txt,html,gif}} \
      ${pkgdir}/usr/share/doc/openssl
}
