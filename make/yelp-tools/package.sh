#!/bin/sh

pkgname=yelp-tools
pkgver=3.32.2
vcs=git
gittag=${pkgver}
relmon_id=8420

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
