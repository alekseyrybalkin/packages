#!/bin/sh

pkgname=sysvinit
SKIP_ARCH_CHECK=1
pkgver=2.93
vcs=git
gittag=${pkgver}

kiin_make() {
    make -C src
}

kiin_install() {
    make ROOT=${pkgdir} -C src install
    rm -rf ${pkgdir}/bin ${pkgdir}/usr/bin
    mv ${pkgdir}/sbin ${pkgdir}/usr/bin
    rm ${pkgdir}/usr/bin/sulogin
    rm -rf ${pkgdir}/usr/share/man/man{1,5}
    rm -rf ${pkgdir}/usr/share/man/man8/{pidof.8,sulogin.8}
}
