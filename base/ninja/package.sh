#!/bin/sh

pkgname=ninja
pkgver=1.9.0
vcs=git
gittag=v${pkgver}
relmon_id=2089
relmon_sed='s/v//g'

kiin_make() {
    python configure.py --bootstrap
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    install -vm755 ninja ${pkgdir}/usr/bin/
}
