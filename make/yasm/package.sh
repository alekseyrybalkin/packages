#!/bin/sh

pkgname=yasm
pkgver=1.3.0
vcs=git
gittag=v${pkgver}
relmon_id=5286

build() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
