#!/bin/sh

pkgname=binutils
pkgver=2.25
extension=gz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  rm -fv etc/standards.info
  sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in
  mkdir -v binutils-build
  cd binutils-build
  ../configure --prefix=/usr --enable-shared --enable-multilib
  make tooldir=${pkgdir}/usr
}

kiin_install() {
  cd binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
}
