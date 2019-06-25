#!/bin/sh

pkgname=libssh2
pkgver=1.9.0
vcs=git
gittag=libssh2-${pkgver}
relmon_id=1730

kiin_make() {
    ./buildconf
    ./configure --prefix=/usr \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
