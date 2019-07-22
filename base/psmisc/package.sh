#!/bin/sh

pkgname=psmisc
pkgver=23.2
vcs=git
gittag=v${pkgver}
relmon_id=3721

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
