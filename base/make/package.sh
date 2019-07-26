#!/bin/sh

pkgname=make
pkgver=4.2.1
vcs=git
gittag=${pkgver}
relmon_id=1877

build() {
    sed -i -e 's/po //g' Makefile.am
    sed -i -e 's/doc //g' Makefile.am
    sed -i -e 's/-Werror//g' configure.ac
    autoreconf -fi
    patch -Np1 -i ../make-4.2.1-glob-internals.patch
    patch -Np1 -i ../make-4.2.1-glob-v2.patch
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
