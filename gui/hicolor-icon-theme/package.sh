#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.15
vcs=git
gittag=${pkgver}
urls="http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1316

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
