#!/bin/sh

KIIN_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs=git
# FIXME
gittag=2c9407690352b29206036b4502bcefc74f01063d
pkgver=20170519

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
