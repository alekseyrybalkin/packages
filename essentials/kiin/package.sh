#!/bin/sh

pkgname=kiin
SKIP_ARCH_CHECK=1
vcs=git
pkgver=1.0.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    true
}

kiin_install() {
    mkdir -p ${pkgdir}/{etc,usr/bin,usr/lib/kiin}
    cp kiin.bash ${pkgdir}/usr/bin/kiin
    cp kiin-utils.py ${pkgdir}/usr/lib/kiin
    cp kiin.conf.bash ${pkgdir}/etc
}
