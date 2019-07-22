#!/bin/sh

pkgname=iw
pkgver=5.0.1
vcs=git
gittag=v${pkgver}
relmon_id=1410

kiin_make() {
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} SBINDIR=/usr/bin install
}
