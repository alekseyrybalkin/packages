#!/bin/sh

pkgname=nmap
pkgver=7.60
vcs=git-svn
vcs_pkgname=nmap-git-svn
vcs_clone="git svn clone -Tnmap -tnmap-releases https://svn.nmap.org/ ${vcs_pkgname}"
gittag=origin/tags/nmap-${pkgver}
relmon_id=2096

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
