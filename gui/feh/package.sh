#!/bin/sh

pkgname=feh
pkgver=3.1.3
vcs=git
gittag=${pkgver}
relmon_id=790

kiin_make() {
    make PREFIX=/usr
}

kiin_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
