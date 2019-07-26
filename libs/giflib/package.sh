#!/bin/sh

pkgname=giflib
pkgver=5.2.1
vcs=git
gittag=${pkgver}
relmon_id=1158

build() {
    make
}

package() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
