#!/bin/sh

pkgname=atk
pkgver=2.32.0
vcs=git
gittag=ATK_${pkgver//\./_}
# development versions
#relmon_id=130

kiin_make() {
    mkdir build
    meson --prefix=/usr . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}
