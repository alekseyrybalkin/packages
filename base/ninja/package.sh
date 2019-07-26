#!/bin/sh

pkgname=ninja
pkgver=1.9.0
vcs=git
gittag=v${pkgver}
relmon_id=2089
relmon_sed='s/v//g'

build() {
    python configure.py --bootstrap
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -vm755 ninja ${pkgdir}/usr/bin/
}
