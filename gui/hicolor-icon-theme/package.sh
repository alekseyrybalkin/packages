#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.17
vcs=git
vcs_pkgname=default-icon-theme
gittag=${pkgver}
relmon_id=1316

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
