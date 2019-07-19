#!/bin/sh

pkgname=libxdg-basedir
pkgver=1.2.0
vcs=git
gittag=libxdg-basedir-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
