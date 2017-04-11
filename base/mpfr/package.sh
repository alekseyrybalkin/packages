#!/bin/sh

pkgname=mpfr
pkgver=3.1.5
ARCH_VERSION=3.1.5.p2
vcs=git-svn
vcs_pkgname=mpfr-git-svn
vcs_clone="git svn clone -Ttrunk -ttags svn://scm.gforge.inria.fr/svnroot/mpfr ${vcs_pkgname}"
gittag=origin/tags/${pkgver}
urls="http://www.mpfr.org/mpfr-${pkgver}/mpfr-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-thread-safe \
        --disable-static \
        --docdir=/usr/share/doc/mpfr
    make
    make html
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
