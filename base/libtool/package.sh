#!/bin/sh

pkgname=libtool
pkgver=2.4.6
ARCH_VERSION=2.4.6+42+gb88cebd5-3
vcs=git
gittag=v${pkgver}
relmon_id=1741

build() {
    MAKEFLAGS=
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
