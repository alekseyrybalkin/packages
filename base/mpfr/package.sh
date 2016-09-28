#!/bin/sh

pkgname=mpfr
pkgver=3.1.5
vcs=git-svn
vcs_pkgname=mpfr-git-svn
svnrev=10893
urls="http://www.mpfr.org/mpfr-${pkgver}/mpfr-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cd branches/3.1
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-thread-safe \
        --disable-static \
        --docdir=/usr/share/doc/mpfr
    make
    make html
}

kiin_install() {
    cd branches/3.1
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
