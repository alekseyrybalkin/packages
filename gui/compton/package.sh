#!/bin/sh

pkgname=compton
pkgver=7
vcs=git
gittag=v${pkgver}
relmon_id=8381

kiin_make() {
    git clone -s `find_vcs_repo test.h` subprojects/test.h
    git submodule update --init

    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
