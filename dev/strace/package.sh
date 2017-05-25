#!/bin/sh

pkgname=strace
vcs=git
pkgver=4.17
gittag=v${pkgver}
relmon_id=4897

kiin_make() {
    ./bootstrap
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
