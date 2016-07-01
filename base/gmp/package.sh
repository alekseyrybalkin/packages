#!/bin/sh

pkgname=gmp
_majorver=6.1
pkgver=${_majorver}.1
vcs=mercurial
vcs_pkgname=gmp-${_majorver}
hgtag=a393efc6c2be
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
