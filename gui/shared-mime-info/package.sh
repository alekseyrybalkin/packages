#!/bin/sh

pkgname=shared-mime-info
pkgver=1.12
vcs=git
gittag=Release-${pkgver//\./-}
relmon_id=5524

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
