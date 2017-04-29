#!/bin/sh

pkgname=json-glib
vcs=git

pkgver=1.2.8
gittag=${pkgver}
relmon_id=13144


kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
