#!/bin/sh

pkgname=serf
pkgver=1.3.9
vcs=git-svn
vcs_pkgname=serf-git-svn
vcs_clone="git svn clone -Ttrunk -ttags https://svn.apache.org/repos/asf/serf/ -r 1698000:HEAD ${vcs_pkgname}"
gittag=origin/tags/${pkgver}
urls="https://archive.apache.org/dist/serf/serf-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2

kiin_make() {
    sed -i "/Append/s:RPATH=libdir,::" SConstruct
    sed -i "/Default/s:lib_static,::" SConstruct
    sed -i "/Alias/s:install_static,::" SConstruct
    scons PREFIX=/usr
}

kiin_install() {
    mkdir -p ${pkgdir}/usr
    scons PREFIX=${pkgdir}/usr install
    chmod 644 ${pkgdir}/usr/include/serf-1/*
}
