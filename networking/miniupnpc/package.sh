#!/bin/sh

pkgname=miniupnpc
pkgver=2.0
ARCH_VERSION=2.0.20170509
vcs=git
vcs_pkgname=miniupnp
gittag=miniupnpc_${pkgver//\./_}
urls="http://miniupnp.free.fr/files/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

undead_make() {
    cd miniupnpc
    make
}

undead_install() {
    cd miniupnpc
    make PREFIX=${pkgdir} install
    install -Dm644 man3/miniupnpc.3 ${pkgdir}/usr/share/man/man3/miniupnpc.3
}
