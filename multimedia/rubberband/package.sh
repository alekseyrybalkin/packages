#!/bin/sh

pkgname=rubberband
pkgver=1.8.2
vcs=mercurial
hgtag=v${pkgver}
relmon_id=4222

kiin_make() {
    sed -i -e '/cp.*JNI_TARGET/d' Makefile.in
    autoreconf -vfi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
