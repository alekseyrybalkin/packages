#!/bin/sh

pkgname=yasm
pkgver=1.3.0
vcs=git
gittag=v${pkgver}
urls="http://www.tortall.net/projects/yasm/releases/yasm-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
