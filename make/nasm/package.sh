#!/bin/sh

pkgname=nasm
pkgver=2.14.02
vcs=git
gittag=nasm-${pkgver}
relmon_id=2048

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make dist
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
