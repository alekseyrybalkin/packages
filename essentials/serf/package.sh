#!/bin/sh

pkgname=serf
pkgver=1.3.9
vcs=git-svn
vcs_pkgname=serf-git-svn
svnrev=1761053
urls="https://archive.apache.org/dist/serf/serf-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i "/Append/s:RPATH=libdir,::" SConstruct
    sed -i "/Default/s:lib_static,::" SConstruct
    sed -i "/Alias/s:install_static,::" SConstruct
    scons PREFIX=/usr
}

kiin_install() {
    mkdir -p ${pkgdir}/usr
    scons PREFIX=${pkgdir}/usr install
}
