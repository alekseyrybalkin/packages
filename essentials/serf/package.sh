#!/bin/sh

pkgname=serf
pkgver=1.3.9
vcs=git
gittag=${pkgver}
relmon_id=1720

kiin_make() {
    sed -i "/Append/s:RPATH=libdir,::" SConstruct
    sed -i "/Default/s:lib_static,::" SConstruct
    sed -i "/Alias/s:install_static,::" SConstruct

    # scons 3.0.0 compatibility
    sed -i -e 's/print\(.*\)/print(\1)/g' SConstruct

    scons PREFIX=/usr
}

kiin_install() {
    mkdir -p ${pkgdir}/usr
    scons PREFIX=${pkgdir}/usr install
    chmod 644 ${pkgdir}/usr/include/serf-1/*
}
