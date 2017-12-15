#!/bin/sh

pkgname=vimium
SKIP_ARCH_CHECK=1
pkgver=1.62.4
vcs=git
gittag=v${pkgver}

kiin_make() {
    rm -rf .git
    cake build
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/chromium/extensions/
    cp -r . ${pkgdir}/usr/lib/chromium/extensions/vimium
}
