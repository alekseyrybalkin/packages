#!/bin/sh

pkgname=nmap
pkgver=7.40
vcs=git-svn
vcs_pkgname=nmap-git-svn
vcs_clone="git svn clone -Tnmap -tnmap-releases https://svn.nmap.org/ ${vcs_pkgname}"
gittag=origin/tags/nmap-${pkgver}

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
