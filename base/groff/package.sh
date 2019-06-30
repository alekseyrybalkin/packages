#!/bin/sh

pkgname=groff
pkgver=1.22.4
vcs=git
gittag=${pkgver}
urls="http://ftp.gnu.org/gnu/groff/groff-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1253

kiin_make() {
    MAKEFLAGS=
    sed -i -e '/doc\.am/d' Makefile.am
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    PAGE=A4 ./configure --prefix=/usr --without-x --with-doc=no
    make
}

kiin_install() {
    MAKEFLAGS=
    make prefix=${pkgdir}/usr install
    rm -rf ${pkgdir}/usr/share/doc/groff-${pkgver}/pdf
}
