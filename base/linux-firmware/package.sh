#!/bin/sh

pkgname=linux-firmware
vcs="git"
gittag=2892af06dc38a764938f0583a2eac30595108799
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -pv ${pkgdir}/lib/firmware
  if [ `hostname` == 'ritchie' ]; then
    mkdir -pv ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx-0.fw ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx_hdr-0.fw ${pkgdir}/lib/firmware/brcm
  fi
  if [ `hostname` == 'snowden' ]; then
    cp -v ./iwlwifi-6000g2a-5.ucode ${pkgdir}/lib/firmware
    cp -v ./iwlwifi-6000g2a-6.ucode ${pkgdir}/lib/firmware
  fi
  if [ `hostname` == 'levison' ]; then
    cp -v ./iwlwifi-5000-1.ucode ${pkgdir}/lib/firmware
    cp -v ./iwlwifi-5000-2.ucode ${pkgdir}/lib/firmware
    cp -v ./iwlwifi-5000-5.ucode ${pkgdir}/lib/firmware
  fi
}
