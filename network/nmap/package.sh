#!/bin/sh

pkgname=nmap
pkgver=7.70
vcs=git
gittag=${pkgver}
relmon_id=2096

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
