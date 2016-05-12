#!/bin/sh

pkgname=gdbm
pkgver=1.11
vcs=git
gittag=82fe16f532fdd46744c51ba931ecd3fee2b10365
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
