#!/bin/sh

pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs="git"
gittag=2892af06dc38a764938f0583a2eac30595108799
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -pv ${pkgdir}/usr/lib/firmware
  if [ `hostname` == 'ritchie' ]; then
    mkdir -pv ${pkgdir}/usr/lib/firmware/brcm
    cp -v ./brcm/bcm43xx-0.fw ${pkgdir}/usr/lib/firmware/brcm
    cp -v ./brcm/bcm43xx_hdr-0.fw ${pkgdir}/usr/lib/firmware/brcm
  fi
  if [ `hostname` == 'snowden' ]; then
    cp -v ./iwlwifi-6000g2a-5.ucode ${pkgdir}/usr/lib/firmware
    cp -v ./iwlwifi-6000g2a-6.ucode ${pkgdir}/usr/lib/firmware
  fi
}
