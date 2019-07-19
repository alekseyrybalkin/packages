#!/bin/sh

pkgname=libxkbcommon
pkgver=0.8.4
vcs=git
gittag=xkbcommon-${pkgver}
relmon_id=1780

kiin_make() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc \
        -D enable-wayland=false \
        -D enable-docs=false \
        . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
