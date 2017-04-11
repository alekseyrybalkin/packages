#!/bin/sh

pkgname=ninja
pkgver=1.7.2
vcs=git
gittag=v${pkgver}
relmon_id=2089
relmon_sed='s/v//g'

kiin_make() {
    python2 configure.py --bootstrap
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/bin
    install -vm755 ninja ${pkgdir}/usr/bin/
}
