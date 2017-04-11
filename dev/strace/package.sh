#!/bin/sh

pkgname=strace
vcs=git
pkgver=4.16
gittag=v${pkgver}

kiin_make() {
    ./bootstrap
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
