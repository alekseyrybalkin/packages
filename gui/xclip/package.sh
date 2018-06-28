#!/bin/sh

pkgname=xclip
pkgver=0.13
vcs=git
gittag=${pkgver}
relmon_id=14150

undead_make() {
    ./bootstrap
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
