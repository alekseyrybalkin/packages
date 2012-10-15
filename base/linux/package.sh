#!/bin/sh

pkgname=linux
pkgver=3.6.2
urls="http://www.kernel.org/pub/${pkgname}/kernel/v3.x/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make mrproper
  cp -v ../config-x86_64 .config
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/boot
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-${pkgver}-kiin
  cp -v System.map ${pkgdir}/boot/System.map-${pkgver}-kiin

  # remove installed firmware, package `linux-firmware` deals with that
  rm -rf ${pkgdir}/lib/firmware
}
