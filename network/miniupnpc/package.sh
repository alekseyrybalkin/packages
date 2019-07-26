#!/bin/sh

pkgname=miniupnpc
pkgver=2.1
ARCH_VERSION=2.1.20190408
vcs=git
vcs_pkgname=miniupnp
gittag=miniupnpc_${pkgver//\./_}

build() {
    cd miniupnpc
    make
}

package() {
    cd miniupnpc
    make DESTDIR=${pkgdir} install
}
