#!/bin/sh

pkgname=linux-firmware
vcs="git"
gittag=fae71211eb70eb4d50de72a9dd70ece21905af57
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  # install some stupid proprietary shit for wifi-card to work.
  # it's sickening.
  # btw, do I really need all of these?
  mkdir -pv ${pkgdir}/lib/firmware
  if [ `hostname` == 'alien' ]; then
    cp -v ./iwlwifi-5000-1.ucode ${pkgdir}/lib/firmware
    cp -v ./iwlwifi-5000-2.ucode ${pkgdir}/lib/firmware
    cp -v ./iwlwifi-5000-5.ucode ${pkgdir}/lib/firmware
  fi
  if [ `hostname` == 'ritchie' ]; then
    mkdir -pv ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx-0.fw ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx_hdr-0.fw ${pkgdir}/lib/firmware/brcm
  fi
}
