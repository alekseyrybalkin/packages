#!/bin/sh

pkgname=rhash
pkgver=1.3.4
vcs=git
gittag=v${pkgver}
relmon_id=13843
relmon_sed='s/v//g'

kiin_make() {
    make build-shared
}

kiin_install() {
    make PREFIX=/usr DESTDIR=${pkgdir} install-shared
    make -C librhash PREFIX=/usr DESTDIR=${pkgdir} install-headers install-lib-shared install-lib-static
}
