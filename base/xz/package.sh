#!/bin/sh

pkgname=xz
pkgver=5.2.4
vcs=git
gittag=v${pkgver}
relmon_id=5277

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/xz
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
