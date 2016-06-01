#!/bin/sh

pkgname=gdbm
pkgver=1.12
vcs=git
gittag=e742ba10077685ea2453236b50188683d32abb41
srcdir=${location}/${pkgname}-${pkgver}

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
