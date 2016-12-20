#!/bin/sh

pkgname=nmap
pkgver=7.40
vcs=git-svn
vcs_pkgname=nmap-git-svn
gittag=origin/tags/nmap-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
