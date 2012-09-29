#!/bin/sh

pkgname=bash
pkgver=4.2.037
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-4.2.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/${pkgname}-4.2-fixes-9.patch"
srctar=${pkgname}-4.2.tar.gz
srcdir=${location}/${pkgname}-4.2

kiin_make() {
  patch -Np1 -i ../bash-4.2-fixes-9.patch
  ./configure --prefix=/usr                     \
              --bindir=/bin                     \
              --htmldir=/usr/share/doc/bash-4.2 \
              --without-bash-malloc             \
              --with-installed-readline
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/bin
  ln -sv bash ${pkgdir}/bin/sh
}
