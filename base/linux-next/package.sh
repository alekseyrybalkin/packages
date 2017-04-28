#!/bin/sh

pkgname=linux-next
SKIP_ARCH_CHECK=1
vcs=git
vcs_pkgname=linux
pkgver=next.20170428
gittag=next-20170428

kiin_make() {
    git remote add custom ${SOURCES_HOME}/linux-${pkgver}
    git fetch custom
    git merge custom/eudyptula-suffix
    patch -Np1 -i ../net-next-rhashtable-Do-not-lower-max_elems-when-max_size-is-zero.patch
    make mrproper
    cp -v ../config-x86_64-`hostname` .config
    make
}

kiin_install() {
    mkdir -pv ${pkgdir}/boot
    cp -v arch/x86_64/boot/bzImage ${pkgdir}/boot/vmlinuz-next-kiin

    mkdir -pv ${pkgdir}/usr/lib/
    make INSTALL_MOD_PATH=${pkgdir} modules_install
    mv ${pkgdir}/lib/modules ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/lib

    modules_dir=`ls ${pkgdir}/usr/lib/modules`
    for link in build source; do
        rm ${pkgdir}/usr/lib/modules/${modules_dir}/${link}
        ln -sv ${SOURCES_HOME}/linux-${pkgver} ${pkgdir}/usr/lib/modules/${modules_dir}/${link}
    done
}
