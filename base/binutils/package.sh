#!/bin/sh

pkgname=binutils
pkgver=2.23.2
extension=gz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  rm -fv etc/standards.info
  sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in
  # fix for 2.32.2 and texinfo 5.1 build failure
  sed -i -e 's/@colophon/@@colophon/' \
    -e 's/doc@cygnus.com/doc@@cygnus.com/' bfd/doc/bfd.texinfo
  mkdir -v binutils-build
  cd binutils-build
  ../configure --prefix=/usr --enable-shared --enable-multilib
  make tooldir=${pkgdir}/usr
}

kiin_install() {
  cd binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
  cp -v ../include/libiberty.h ${pkgdir}/usr/include
}
