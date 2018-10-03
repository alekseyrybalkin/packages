#!/bin/sh

pkgname=desktop-file-utils
pkgver=0.23
vcs=git
gittag=${pkgver}
relmon_id=421

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
