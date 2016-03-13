#!/bin/sh

KIIN_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs="git"
gittag=8d1fd61a3723ab8cb6b7bfeb8be38e16282cc1ed
pkgver=1
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -pv ${pkgdir}/usr/lib/firmware
  if [ `hostname` == 'sol' ]; then
    cp -v ./iwlwifi-6*.ucode ${pkgdir}/usr/lib/firmware/
  fi
}
