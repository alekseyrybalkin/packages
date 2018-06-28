#!/bin/sh

pkgname=linux-api-headers
vcs=git
vcs_pkgname=linux
pkgver=4.14.32
gittag=v${pkgver}

undead_make() {
    make mrproper
    make headers_check
}

undead_install() {
    make INSTALL_HDR_PATH=dest headers_install
    find dest/include \( -name .install -o -name ..install.cmd \) -delete
    mkdir -pv ${pkgdir}/usr/include
    cp -rv dest/include/* ${pkgdir}/usr/include
}
