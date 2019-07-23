#!/bin/sh

pkgname=itstool
pkgver=2.0.6
vcs=git
gittag=${pkgver}
relmon_id=13109

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
