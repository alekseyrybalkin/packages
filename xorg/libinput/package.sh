#!/bin/sh

pkgname=libinput
pkgver=1.13.2
vcs=git
gittag=${pkgver}
relmon_id=5781

kiin_make() {
    mkdir build
    meson --prefix=$XORG_PREFIX \
        -D libexecdir=/usr/lib \
        -D udev-dir=/usr/lib/udev \
        -D debug-gui=false \
        -D tests=false \
        -D documentation=false \
        -D libwacom=false \
        . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
