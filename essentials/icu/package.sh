#!/bin/sh

pkgname=icu
pkgver=58.2
vcs=git-svn
vcs_pkgname=icu-git-svn
gittag=origin/tags/release-${pkgver//\./-}
srcdir=${location}/icu-${pkgver}

kiin_make() {
    cd icu4c/source
    patch -Np4 -i ../../../icu-58.1-iterator-reset.patch
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

kiin_install() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
