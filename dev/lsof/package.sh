#!/bin/sh

pkgname=lsof
pkgver=4.87
urls="ftp://sunsite.ualberta.ca/pub/Mirror/lsof/lsof_${pkgver}.tar.bz2"
srctar=${pkgname}_${pkgver}.tar.bz2
srcdir=${location}/${pkgname}_${pkgver}

kiin_make() {
  tar xf ${pkgname}_${pkgver}_src.tar
  cd ${pkgname}_${pkgver}_src
  sed -i 's|/\* #define\tHASSECURITY\t1 \*/|#define\tHASSECURITY\t1|' dialects/linux/machine.h
  sed -i 's/rpc\.h/rpctrash\.h/g' Configure
  ./Configure -n linux
  make
}

kiin_install() {
  cd ${pkgname}_${pkgver}_src
  mkdir -p ${pkgdir}/usr/sbin
  install -Dm0755 -o root -g root lsof ${pkgdir}/usr/sbin
  mkdir -p ${pkgdir}/usr/share/man/man8
  install -Dm0644 -o root -g root lsof.8 ${pkgdir}/usr/share/man/man8
}
