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
  if [ `hostname` == 'ritchie' ]; then
    mkdir -pv ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx-0.fw ${pkgdir}/lib/firmware/brcm
    cp -v ./brcm/bcm43xx_hdr-0.fw ${pkgdir}/lib/firmware/brcm
  fi
}
