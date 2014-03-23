#!/bin/sh

pkgname=openssl
pkgver=1.0.1f
ARCH_VERSION=1.0.1.f
extension=gz
folder="http://www.openssl.org/source/"
check_server=1

. ${KIIN_REPO}/defaults.sh

urls="${urls} http://rybalkin.org/kiin-files/Makefile.org-Fix-usage-of-CC-gcc-m32.patch"

kiin_make() {
  MAKEFLAGS=
  patch -p1 -i ${KIIN_HOME}/tarballs/Makefile.org-Fix-usage-of-CC-gcc-m32.patch
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
