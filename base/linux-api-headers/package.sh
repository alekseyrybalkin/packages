#!/bin/sh

pkgname=linux-api-headers
vcs=git
vcs_pkgname=linux-stable
pkgver=4.8.8
gittag=v${pkgver}
srcdir=${location}/linux-${pkgver}

kiin_make() {
    make mrproper
    make headers_check
}

kiin_install() {
    make INSTALL_HDR_PATH=dest headers_install
    find dest/include \( -name .install -o -name ..install.cmd \) -delete
    mkdir -pv ${pkgdir}/usr/include
    cp -rv dest/include/* ${pkgdir}/usr/include
}
