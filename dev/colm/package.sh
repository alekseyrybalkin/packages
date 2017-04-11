#!/bin/sh

pkgname=colm
SKIP_ARCH_CHECK=1
pkgver=0.13.0.4
vcs=git
gittag=${pkgver}
relmon_id=12622

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
