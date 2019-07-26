#!/bin/sh

pkgname=hicolor-icon-theme
pkgver=0.17
vcs=git
vcs_pkgname=default-icon-theme
gittag=${pkgver}
relmon_id=1316

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/icons/hicolor/icon-theme.cache"
