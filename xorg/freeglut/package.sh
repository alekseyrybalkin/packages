#!/bin/sh

pkgname=freeglut
pkgver=3.0.0
vcs=git-svn
vcs_pkgname=freeglut-git-svn
vcs_clone="git svn clone -Ttrunk -ttags http://svn.code.sf.net/p/freeglut/code/ ${vcs_pkgname}"
gittag=origin/tags/FG_${pkgver//\./_}
urls="http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=846

undead_make() {
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

undead_install() {
    cd build
    make DESTDIR=${pkgdir} install
}
