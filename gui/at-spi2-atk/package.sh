#!/bin/sh

pkgname=at-spi2-atk
pkgver=2.32.0
vcs=git
gittag=AT_SPI2_ATK_${pkgver//\./_}

kiin_make() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

kiin_install() {
    DESTDIR=${pkgdir} ninja -C build install
}

kiin_after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

kiin_after_upgrade() {
    kiin_after_install
}
