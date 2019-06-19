#!/bin/sh

pkgname=physlock
pkgver=13
vcs=git
gittag=v${pkgver}

kiin_make() {
    make PREFIX=/usr
}

kiin_install() {
    make DESTDIR=${pkgdir} PREFIX=/usr install
}
