#!/bin/sh

pkgname=pipewire
pkgver=0.2.6
vcs=git
gittag=${pkgver}

kiin_make() {
    mkdir build
    meson --prefix=/usr \
        -D libexecdir=/usr/lib \
        -D sysconfdir=/etc \
        -D gstreamer=disabled \
        . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
