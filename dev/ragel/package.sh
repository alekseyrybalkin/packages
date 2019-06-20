#!/bin/sh

pkgname=ragel
pkgver=7.0.0.11
vcs=git
gittag=ragel-${pkgver}
relmon_id=12105
relmon_sed='s/ragel-//g;s/\.tar\.gz//g'

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
