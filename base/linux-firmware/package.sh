#!/bin/sh

pkgname=linux-firmware
pkgver=1

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  # install some stupid proprietary shit for wifi-card to work.
  # it's sickening.
  # btw, do I really need all of these?
  mkdir -pv ${pkgdir}/lib/firmware
  cp -v ./iwlwifi-5000-1.ucode ${pkgdir}/lib/firmware
  cp -v ./iwlwifi-5000-2.ucode ${pkgdir}/lib/firmware
  cp -v ./iwlwifi-5000-5.ucode ${pkgdir}/lib/firmware
}
