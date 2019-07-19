#!/bin/sh

pkgname=libconfig
pkgver=1.7.2
vcs=git
gittag=v${pkgver}
relmon_id=1580

kiin_make() {
    autoreconf -vi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
