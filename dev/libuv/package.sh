#!/bin/sh

pkgname=libuv
pkgver=1.11.0
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
    make man -C docs
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -Dm644 docs/build/man/libuv.1 \
        ${pkgdir}/usr/share/man/man1/libuv.1
}
