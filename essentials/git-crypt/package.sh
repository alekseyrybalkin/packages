#!/bin/sh

pkgname=git-crypt
pkgver=0.6.0
vcs=git
gittag=${pkgver}
relmon_id=17093

kiin_make() {
    make ENABLE_MAN=yes PREFIX=/usr
}

kiin_install() {
    make ENABLE_MAN=yes PREFIX=/usr DESTDIR=${pkgdir} install
}
