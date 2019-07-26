#!/bin/sh

pkgname=at-spi2-atk
pkgver=2.32.0
vcs=git
gittag=AT_SPI2_ATK_${pkgver//\./_}

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}

after_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
}

after_upgrade() {
    after_install
}
