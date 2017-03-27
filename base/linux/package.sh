#!/bin/sh

pkgname=linux
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux
pkgver=4.11.rc4
# FIXME
gittag=v4.11-rc4
#gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-kiin

    mkdir -pv ${pkgdir}/usr/lib/
    make INSTALL_MOD_PATH=${pkgdir} modules_install
    mv ${pkgdir}/lib/modules ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/lib

    for link in build source; do
        # FIXME
        rm ${pkgdir}/usr/lib/modules/4.11.0-rc4-kiin/${link}
        # FIXME
        ln -sv ${SOURCES_HOME}/${vcs_pkgname}-${pkgver} ${pkgdir}/usr/lib/modules/4.11.0-rc4-kiin/${link}
    done
}
