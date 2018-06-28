#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.17
vcs=git
gittag=${pkgver}
urls="http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1316

undead_make() {
    ./autogen.sh --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
