#!/bin/sh

pkgname=yasm
pkgver=1.3.0
vcs=git
gittag=v${pkgver}
urls="http://www.tortall.net/projects/yasm/releases/yasm-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=5286

undead_make() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr
    make
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
