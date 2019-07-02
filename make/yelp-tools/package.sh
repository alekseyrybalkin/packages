#!/bin/sh

pkgname=yelp-tools
pkgver=3.32.2
vcs=git
gittag=${pkgver}
relmon_id=8420

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
