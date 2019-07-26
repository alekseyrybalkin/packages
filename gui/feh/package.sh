#!/bin/sh

pkgname=feh
pkgver=3.1.3
vcs=git
gittag=${pkgver}
relmon_id=790

build() {
    make PREFIX=/usr
}

package() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
