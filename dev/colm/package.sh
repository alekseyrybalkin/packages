#!/bin/sh

pkgname=colm
SKIP_ARCH_CHECK=1
pkgver=0.13.0.5
vcs=git
gittag=${pkgver}
relmon_id=12622

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
