#!/bin/sh

pkgname=zlib
pkgver=1.2.11
vcs=git
gittag=v${pkgver}
relmon_id=5303

build() {
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
