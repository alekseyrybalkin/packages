#!/bin/sh

KIIN_NON_FREE=1
SKIP_ARCH_CHECK=1
pkgname=linux-firmware
pkgver=20190618
vcs=git
gittag=${pkgver}

kiin_make() {
    :
}

kiin_install() {
    mkdir -pv ${pkgdir}/usr/lib/firmware
    cp -v ./iwlwifi-6*.ucode ${pkgdir}/usr/lib/firmware/
    cp -v ./iwlwifi*7265* ${pkgdir}/usr/lib/firmware/
}
