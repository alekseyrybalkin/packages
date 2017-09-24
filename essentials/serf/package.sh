#!/bin/sh

pkgname=serf
pkgver=1.3.9
vcs=git-svn
vcs_pkgname=serf-git-svn
vcs_clone="git svn clone -Ttrunk -ttags https://svn.apache.org/repos/asf/serf/ -r 1698000:HEAD ${vcs_pkgname}"
gittag=origin/tags/${pkgver}
urls="https://archive.apache.org/dist/serf/serf-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
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
