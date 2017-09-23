#!/bin/sh

KIIN_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs=git
# FIXME
gittag=a61ac5cf8374edbfe692d12f805a1b194f7fead2
pkgver=20170906

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
