#!/bin/sh

pkgname=linux-mainline
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux
pkgver=4.12.rc3
gittag=v4.12-rc3

kiin_make() {
    git remote add custom /home/bullshit/linux-${pkgver}
    git fetch custom
    git merge custom/eudyptula-suffix
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
