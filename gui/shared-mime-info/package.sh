#!/bin/sh

pkgname=shared-mime-info
pkgver=1.8
vcs=git
gittag=Release-${pkgver//\./-}
urls="http://freedesktop.org/~hadess/shared-mime-info-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz

kiin_make() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr --disable-default-make-check
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}

kiin_after_install() {
    update-mime-database -n /usr/share/mime
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/share/applications/mimeinfo.cache"
