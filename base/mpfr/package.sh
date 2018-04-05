#!/bin/sh

pkgname=mpfr
pkgver=4.0.1
vcs=git-svn
vcs_pkgname=mpfr-git-svn
vcs_clone="git svn clone -Ttrunk -ttags svn://scm.gforge.inria.fr/svnroot/mpfr ${vcs_pkgname}"
gittag=origin/tags/${pkgver}
urls="http://www.mpfr.org/mpfr-${pkgver}/mpfr-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
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
