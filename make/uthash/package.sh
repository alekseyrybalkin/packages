#!/bin/sh

pkgname=uthash
pkgver=2.1.0
vcs=git
gittag=v${pkgver}
relmon_id=5062

kiin_make() {
    :
}

kiin_install() {
    install -dm755 ${pkgdir}/usr/include/
    for h in src/*.h; do
        install -m 644 ${h} ${pkgdir}/usr/include/
    done
}
