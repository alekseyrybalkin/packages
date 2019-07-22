#!/bin/sh

pkgname=mpfr
pkgver=4.0.2
vcs=git-svn
vcs_pkgname=mpfr-git-svn
gittag=origin/tags/${pkgver}
relmon_id=2019

kiin_make() {
    mkdir m4
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-thread-safe \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --docdir=/usr/share/doc/mpfr
    make
    make html
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
