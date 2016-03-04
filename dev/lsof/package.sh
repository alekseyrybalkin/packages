#!/bin/sh

pkgname=lsof
pkgver=4.89
extension=bz2
folder="ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
check_server=1

srctar=${pkgname}_${pkgver}.tar.bz2

. ${KIIN_REPO}/defaults.sh

srcdir=${location}/${pkgname}_${pkgver}

ver_grep="^${pkgname}_[^-]*\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}_//g" | sed -r "s/\.tar\.${extension}$//g"
}

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
  mkdir -p ${pkgdir}/usr/bin
  install -Dm0755 -o root -g root lsof ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man8
  install -Dm0644 -o root -g root lsof.8 ${pkgdir}/usr/share/man/man8
}
