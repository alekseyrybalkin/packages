#!/bin/sh

pkgname=gdk-pixbuf
ARCH_NAME=gdk-pixbuf2
pkgver=2.38.1
vcs=git
gittag=${pkgver}
relmon_id=9533

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}

after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

after_upgrade() {
    after_install
}

known="usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
