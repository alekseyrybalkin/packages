#!/bin/sh

pkgname=icu
pkgver=61.1
vcs=git-svn
vcs_pkgname=icu-git-svn
vcs_clone="git svn clone -Ttrunk -ttags http://source.icu-project.org/repos/icu ${vcs_pkgname}"
gittag=origin/tags/release-${pkgver//\./-}

undead_make() {
    cd icu4c/source
    # glibc 2.26 fix
    sed -i 's/xlocale/locale/' i18n/digitlst.cpp
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

undead_install() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
