#!/bin/sh

pkgname=rhash
pkgver=1.3.6
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
    make DESTDIR=${pkgdir} install
    make -C librhash DESTDIR=${pkgdir} install-headers install-lib-shared install-lib-static
}
