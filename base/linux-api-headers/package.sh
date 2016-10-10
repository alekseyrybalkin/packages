#!/bin/sh

pkgname=linux-api-headers
vcs=git
vcs_pkgname=linux-stable
pkgver=4.8.1
gittag=v${pkgver}
srcdir=${location}/linux-${pkgver}

kiin_make() {
    git revert --no-edit d352cf47d93e39494b44b792cca8d35a3a0bd9b3
    make mrproper
    make headers_check
}

kiin_install() {
    make INSTALL_HDR_PATH=dest headers_install
    find dest/include \( -name .install -o -name ..install.cmd \) -delete
    mkdir -pv ${pkgdir}/usr/include
    cp -rv dest/include/* ${pkgdir}/usr/include
}
