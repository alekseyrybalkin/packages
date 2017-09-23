#!/bin/sh

pkgname=libtool
pkgver=2.4.6
ARCH_VERSION=2.4.6+40+g6ca5e224
vcs=git
gittag=v${pkgver}
relmon_id=1741

kiin_make() {
    MAKEFLAGS=
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
