#!/bin/sh

pkgname=libepoxy
pkgver=1.5.3
vcs=git
gittag=${pkgver}
relmon_id=6090

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
