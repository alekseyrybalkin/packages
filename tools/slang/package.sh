#!/bin/sh

pkgname=slang
pkgver=2.3.2
vcs=git
gittag=v${pkgver}
relmon_id=4829

build() {
    MAKEFLAGS=
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --build=x86_64-unknown-linux-gnu \
        --without-png
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install-all
}
