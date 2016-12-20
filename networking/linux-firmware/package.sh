#!/bin/sh

KIIN_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs=git
gittag=4b9559fb0565f582a21a4070a81a3b6a7d77610b
pkgver=20161205
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    :
}

kiin_install() {
    mkdir -pv ${pkgdir}/usr/lib/firmware
    if [ `hostname` == 'sol' ]; then
        cp -v ./iwlwifi-6*.ucode ${pkgdir}/usr/lib/firmware/
        cp -v ./iwlwifi*7265* ${pkgdir}/usr/lib/firmware/
    fi
}
