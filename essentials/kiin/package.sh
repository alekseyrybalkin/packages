#!/bin/sh

pkgname=kiin
SKIP_ARCH_CHECK=1
pkgver=36
vcs=git
gittag=v${pkgver}

kiin_make() {
    true
}

kiin_install() {
    mkdir -p ${pkgdir}/{etc,usr/bin,usr/lib/kiin}
    cp kiin.bash ${pkgdir}/usr/bin/kiin
    cp kiin-utils.py ${pkgdir}/usr/lib/kiin
    cp kiin.conf.bash ${pkgdir}/etc
}
