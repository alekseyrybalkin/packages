#!/bin/sh

pkgname=linux-mainline
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux
_ver=4.13
_rc=rc2
pkgver=${_ver}.${_rc}
gittag=v${_ver}-${_rc}

kiin_make() {
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-mainline-kiin

    mkdir -pv ${pkgdir}/usr/lib/
    make INSTALL_MOD_PATH=${pkgdir} modules_install
    mv ${pkgdir}/lib/modules ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/lib

    modules_dir=`ls ${pkgdir}/usr/lib/modules`
    for link in build source; do
        rm ${pkgdir}/usr/lib/modules/${modules_dir}/${link}
        ln -sv /home/bullshit/linux-${pkgver} ${pkgdir}/usr/lib/modules/${modules_dir}/${link}
    done
}
