#!/bin/sh

pkgname=libksba
pkgver=1.3.5
vcs=git
gittag=libksba-${pkgver}
relmon_id=1649

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --enable-maintainer-mode
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
