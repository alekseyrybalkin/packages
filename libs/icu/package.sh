#!/bin/sh

pkgname=icu
pkgver=64.2
vcs=git
gittag=release-${pkgver//\./-}

kiin_make() {
    cd icu4c/source
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

kiin_install() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
