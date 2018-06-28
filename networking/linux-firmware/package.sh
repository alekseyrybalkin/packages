#!/bin/sh

UNDEAD_NON_FREE=1
pkgname=linux-firmware
SKIP_ARCH_CHECK=1
vcs=git
# FIXME
gittag=2451bb228f6401ca3f2ecd498bf3bab613c532a7
pkgver=20171206

undead_make() {
    :
}

undead_install() {
    mkdir -pv ${pkgdir}/usr/lib/firmware
    if [ -f /etc/laptop ]; then
        cp -v ./iwlwifi-6*.ucode ${pkgdir}/usr/lib/firmware/
        cp -v ./iwlwifi*7265* ${pkgdir}/usr/lib/firmware/
    fi
}
