#!/bin/sh

pkgname=miniupnpc
pkgver=2.1
ARCH_VERSION=2.1.20190408
vcs=git
vcs_pkgname=miniupnp
gittag=miniupnpc_${pkgver//\./_}

kiin_make() {
    cd miniupnpc
    make
}

kiin_install() {
    cd miniupnpc
    make DESTDIR=${pkgdir} install
}
