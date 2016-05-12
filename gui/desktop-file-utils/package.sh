#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.22
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
