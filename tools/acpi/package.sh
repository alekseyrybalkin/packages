#!/bin/sh

pkgname=acpi
pkgver=1.7
vcs=git
gittag=${pkgver}
relmon_id=17

kiin_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
