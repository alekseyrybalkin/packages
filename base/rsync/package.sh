#!/bin/sh

pkgname=rsync
pkgver=3.1.3
vcs=git
gittag=v${pkgver}
relmon_id=4217

kiin_make() {
    ./configure --prefix=/usr --without-included-zlib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
