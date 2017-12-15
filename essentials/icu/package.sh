#!/bin/sh

pkgname=icu
pkgver=60.2
vcs=git-svn
vcs_pkgname=icu-git-svn
vcs_clone="git svn clone -Ttrunk -ttags http://source.icu-project.org/repos/icu ${vcs_pkgname}"
gittag=origin/tags/release-${pkgver//\./-}

kiin_make() {
    cd icu4c/source
    # glibc 2.26 fix
    sed -i 's/xlocale/locale/' i18n/digitlst.cpp
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

kiin_install() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
