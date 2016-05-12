#!/bin/sh

pkgname=gmp
pkgver=6.1.0
vcs=mercurial
hgtag=gmp-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./.bootstrap
    ./configure --prefix=/usr \
        --enable-cxx \
        --disable-static \
        --build=x86_64-pc-linux-gnu \
        --docdir=/usr/share/doc/gmp
    make
    make html
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
