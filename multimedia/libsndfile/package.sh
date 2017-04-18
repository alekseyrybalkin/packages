#!/bin/sh

pkgname=libsndfile
pkgver=1.0.28
#vcs=git
#gittag=${pkgver}
urls="http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr --disable-sqlite
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
