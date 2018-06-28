#!/bin/sh

pkgname=libepoxy
pkgver=1.5.0
vcs=git
gittag=${pkgver}
urls="http://crux.nu/files/libepoxy-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=6090

undead_make() {
    ./autogen.sh --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
