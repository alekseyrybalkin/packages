#!/bin/sh

pkgname=shared-mime-info
pkgver=1.9
vcs=git
gittag=Release-${pkgver//\./-}
urls="http://freedesktop.org/~hadess/shared-mime-info-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=5524

undead_make() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr --disable-default-make-check
    make
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}

undead_after_install() {
    update-mime-database -n /usr/share/mime
}

undead_after_upgrade() {
    undead_after_install
}

known="usr/share/applications/mimeinfo.cache"
