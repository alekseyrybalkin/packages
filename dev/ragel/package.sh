#!/bin/sh

pkgname=ragel
pkgver=7.0.0.10
vcs=git
gittag=ragel-${pkgver}
relmon_id=12105
relmon_sed='s/ragel-//g;s/\.tar\.gz//g'

undead_make() {
    export CXXFLAGS="${CXXFLAGS} -Wno-narrowing"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
