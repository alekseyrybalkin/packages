#!/bin/sh

pkgname=json-glib
vcs=git

pkgver=1.2.8
gittag=${pkgver}


kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
