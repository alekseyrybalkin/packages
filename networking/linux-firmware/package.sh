#!/bin/sh

KIIN_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs=git
# FIXME
gittag=bf04291309d3169c0ad3b8db52564235bbd08e30
pkgver=20171009

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
