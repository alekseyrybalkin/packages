#!/bin/sh

pkgname=gdk-pixbuf
ARCH_NAME=gdk-pixbuf2
pkgver=2.38.1
vcs=git
gittag=${pkgver}
relmon_id=9533

kiin_make() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}

kiin_after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
