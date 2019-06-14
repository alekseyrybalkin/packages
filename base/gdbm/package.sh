#!/bin/sh

pkgname=gdbm
pkgver=1.18.1
vcs=git
gittag=v${pkgver}
relmon_id=882

kiin_make() {
    MAKEFLAGS=
    autoreconf -fi
    ./configure --prefix=/usr --disable-static --enable-libgdbm-compat
    make
}

kiin_install() {
    MAKEFLAGS=
    make prefix=${pkgdir}/usr install
}
