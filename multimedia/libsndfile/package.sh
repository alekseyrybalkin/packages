#!/bin/sh

pkgname=libsndfile
pkgver=1.0.28
#vcs=git
#gittag=${pkgver}
urls="http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=13277

kiin_make() {
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --disable-sqlite
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
