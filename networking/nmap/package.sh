#!/bin/sh

pkgname=nmap
pkgver=7.31
vcs=git-svn
vcs_pkgname=nmap-git-svn
svnrev=36383
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
