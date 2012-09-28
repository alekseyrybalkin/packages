#!/bin/sh

pkgname=linux
pkgver=3.5.3
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
  cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-3.5.3-rybalkiin-1
  cp -v System.map ${pkgdir}/boot/System.map-3.5.3
  cp -v .config ${pkgdir}/boot/config-3.5.3

  install -d ${pkgdir}/usr/share/doc/linux-3.5.3
  cp -r Documentation/* ${pkgdir}/usr/share/doc/linux-3.5.3

  # install some stupid proprietary shit for wifi-card to work.
  # it's sickening.
  # btw, do I really need all of these?
  mkdir -pv ${pkgdir}/lib/firmware
  cp -v ../iwlwifi-5000-1.ucode ${pkgdir}/lib/firmware
  cp -v ../iwlwifi-5000-2.ucode ${pkgdir}/lib/firmware
  cp -v ../iwlwifi-5000-5.ucode ${pkgdir}/lib/firmware
}
