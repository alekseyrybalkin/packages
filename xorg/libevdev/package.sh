#!/bin/sh

pkgname=libevdev
pkgver=1.7.0
vcs=git
gittag=libevdev-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
