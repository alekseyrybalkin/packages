#!/bin/sh

pkgname=linux-api-headers
vcs=git
vcs_pkgname=linux
pkgver=next.20170428
# FIXME
gittag=next-20170428
#gittag=v${pkgver}

kiin_make() {
    git remote add custom ${SOURCES_HOME}/linux-${pkgver}
    git fetch custom
    git merge custom/eudyptula-suffix
    make mrproper
    make headers_check
}

kiin_install() {
    make INSTALL_HDR_PATH=dest headers_install
    find dest/include \( -name .install -o -name ..install.cmd \) -delete
    mkdir -pv ${pkgdir}/usr/include
    cp -rv dest/include/* ${pkgdir}/usr/include
}
