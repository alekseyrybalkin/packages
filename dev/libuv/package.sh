#!/bin/sh

pkgname=libuv
pkgver=1.15.0
vcs=git
gittag=v${pkgver}
relmon_id=10784

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
