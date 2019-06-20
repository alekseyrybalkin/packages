#!/bin/sh

pkgname=colm
SKIP_ARCH_CHECK=1
pkgver=0.13.0.6
vcs=git
gittag=colm-${pkgver}
relmon_id=12622

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
