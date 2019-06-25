#!/bin/sh

pkgname=rhash
pkgver=1.3.8
vcs=git
gittag=v${pkgver}
relmon_id=13843
relmon_sed='s/v//g'

kiin_make() {
    ./configure --prefix=/usr \
        --sysconfdir=/etc
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
    make -C librhash DESTDIR=${pkgdir} install-lib-headers install-lib-shared install-lib-static install-so-link
}
