#!/bin/sh

pkgname=xorgproto
pkgver=2019.1
vcs=git
gittag=${pkgname}-${pkgver}

kiin_make() {
    mkdir build
    meson --prefix=/usr . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
