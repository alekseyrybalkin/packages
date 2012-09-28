#!/bin/sh

pkgname=linux
pkgver=3.5.4
urls="http://www.kernel.org/pub/${pkgname}/kernel/v3.x/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64 .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/lib/modules
  make INSTALL_MOD_PATH=${pkgdir} modules_install
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-${pkgver}-rybalkiin-1
  cp -v System.map ${pkgdir}/boot/System.map-${pkgver}
  cp -v .config ${pkgdir}/boot/config-${pkgver}

  install -d ${pkgdir}/usr/share/doc/linux-${pkgver}
  cp -r Documentation/* ${pkgdir}/usr/share/doc/linux-${pkgver}

  # remove installed firmware, package `linux-firmware` deals with that
  rm -rf ${pkgdir}/lib/firmware
}
