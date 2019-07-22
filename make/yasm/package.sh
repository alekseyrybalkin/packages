#!/bin/sh

pkgname=yasm
pkgver=1.3.0
vcs=git
gittag=v${pkgver}
relmon_id=5286

kiin_make() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
